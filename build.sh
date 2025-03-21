#!/bin/bash

# Create build directory if it doesn't exist
mkdir -p build

# Copy CSS file to build directory
cp templates/style.css build/style.css

# Build main versions
for version in versions/main/*.md; do
  if [ -f "$version" ]; then
    filename=$(basename "$version" .md)
    # Generate HTML
    pandoc "$version" \
      -o "build/${filename}.html" \
      --standalone \
      --css=style.css
    # Convert to PDF
    weasyprint "build/${filename}.html" "build/${filename}.pdf"
  fi
done

# Build job-specific versions
for company_dir in versions/jobs/*/; do
  if [ -d "$company_dir" ]; then
    company_name=$(basename "$company_dir")
    for version in "$company_dir"*.md; do
      if [ -f "$version" ] && [ "$(basename "$version")" != "job_description.md" ]; then
        filename="${company_name}_$(basename "$version" .md)"
        # Generate HTML
        pandoc "$version" \
          -o "build/${filename}.html" \
          --standalone \
          --css=style.css
        # Convert to PDF
        weasyprint "build/${filename}.html" "build/${filename}.pdf"
      fi
    done
  fi
done

echo "Resume PDFs and HTML previews generated in the build directory"
echo "To preview your resume, open any .html file in the build directory in your browser" 