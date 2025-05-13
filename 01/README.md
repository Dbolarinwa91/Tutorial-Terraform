# How to Add Comments in Terraform

This guide explains the different methods for adding comments to your Terraform configuration files.

## Comment Types in Terraform

Terraform supports three different comment styles:

### 1. Hash Comments (#)

Single-line comments can be created using the hash (`#`) symbol:

```hcl
# This is a single-line comment
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"  # This is an inline comment
}
```

### 2. Double-Slash Comments (//)

Single-line comments can also be created using double slashes (`//`):

```hcl
// This is another single-line comment
resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket"  // This is an inline comment
}
```

### 3. Block Comments (/* */)

Multi-line comments can be created using `/*` to start and `*/` to end:

```hcl
/* This is a multi-line comment
   You can include multiple lines of text
   within this comment block */
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
```

## Best Practices for Commenting Terraform Code

### When to Use Comments

1. **Module Documentation**: Describe what a module does, its inputs, outputs, and dependencies.
2. **Resource Explanation**: Explain why a resource is configured in a specific way.
3. **Variable Descriptions**: Clarify the purpose and expected values for variables.
4. **Complex Logic**: Document complex conditional expressions or functions.
5. **Temporary Changes**: Mark temporary configurations or workarounds.

### Comment Style Guidelines

- Keep comments concise and relevant
- Update comments when you update code
- Use consistent comment style throughout your codebase
- Comment on "why" rather than "what" (the code already shows what is happening)
- For module and variable documentation, consider using description arguments instead of comments



## Terraform Documentation

For more information on Terraform syntax and configuration, refer to the [official Terraform documentation](https://www.terraform.io/docs/language/index.html).
