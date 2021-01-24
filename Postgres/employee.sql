CREATE TABLE "Titles" (
    "title_id" text   NOT NULL,
    "title" VarChar(50)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_id" text   NOT NULL,
    "title_id" text   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VarChar(50)   NOT NULL,
    "last_name" VarChar(50)   NOT NULL,
    "sex" VarChar(2)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "Departments" (
    "dept_no" text   NOT NULL,
    "dept_name" VarChar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "emp_id" text   NOT NULL,
    "dept_no" text   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" text   NOT NULL,
	"emp_no" text   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_id" text   NOT NULL,
    "salary" int   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_title_id" FOREIGN KEY("title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_DeptID" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_DeptID" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmpID" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");