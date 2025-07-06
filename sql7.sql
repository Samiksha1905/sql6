use IBM

select * from Employ

CREATE PROCEDURE GetEmployStatus
    @ID INT,
    @Status NVARCHAR(20) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Employ WHERE ID = @EmployID AND IsActive = 1)
        SET @Status = 'Active'
    ELSE
        SET @Status = 'Inactive'
END

CREATE FUNCTION dbo.CalculateBonus
(
    @Salary DECIMAL(10,2),
    @PerformanceRating INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Bonus DECIMAL(10,2)

    IF @PerformanceRating >= 8
        SET @Bonus = @Salary * 0.20
    ELSE IF @PerformanceRating >= 5
        SET @Bonus = @Salary * 0.10
    ELSE
        SET @Bonus = 0

    RETURN @Bonus
END