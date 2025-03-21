# Resume Builder

A flexible resume builder that allows quick iteration and customization for different job applications.

## Project Structure
```
resume/
├── versions/
│   ├── main/                    # Main versions
│   │   ├── fullstack.md         # Full-stack focused version
│   │   ├── frontend.md          # Frontend/UX focused version
│   │   └── mobile.md            # Mobile focused version
│   │
│   └── jobs/                    # Job-specific versions
│       ├── company1/            # Folder for each company
│       │   ├── fullstack.md     # Full-stack version for company1
│       │   └── job_description.md # Original job posting
│       │
│       └── company2/            # Another company's folder
│           ├── frontend.md      # Frontend version for company2
│           └── job_description.md # Original job posting
├── templates/
│   └── style.css               # CSS styling for all versions
├── build/                      # Generated PDFs and HTML previews
├── build.sh                    # Script to generate all versions
├── new_version.sh              # Helper script to create new versions
└── paste_job.sh                # Helper script to paste job descriptions
```

## Setup
1. Install required tools:
   ```bash
   brew install pandoc
   brew install weasyprint
   ```

2. Make scripts executable:
   ```bash
   chmod +x build.sh new_version.sh paste_job.sh
   ```

## Usage

### Complete Workflow Example
Let's say you're applying for a fullstack position at Google:

1. Create a new version for Google:
   ```bash
   ./new_version.sh google fullstack
   ```
   This creates the necessary files in `versions/jobs/google/`

2. Paste the job description:
   ```bash
   ./paste_job.sh google
   ```
   Then paste the job description and press Ctrl+D (Mac/Linux) or Ctrl+Z (Windows) when done

3. Edit the resume to match the job:
   ```bash
   # Open the resume file in your preferred editor
   nano versions/jobs/google/fullstack.md
   # or
   vim versions/jobs/google/fullstack.md
   ```

4. Generate the PDF and HTML:
   ```bash
   ./build.sh
   ```
   This creates `build/google_fullstack.html` and `build/google_fullstack.pdf`

### Available Commands

#### Creating New Versions
```bash
./new_version.sh <company_name> <version_type>
```
Example:
```bash
# Create a fullstack version for Google
./new_version.sh google fullstack

# Create a frontend version for Apple
./new_version.sh apple frontend

# Create a mobile version for Microsoft
./new_version.sh microsoft mobile
```

#### Pasting Job Descriptions
```bash
./paste_job.sh <company_name>
```
Example:
```bash
./paste_job.sh google
```

#### Building All Versions
```bash
./build.sh
```

Available version types:
- `fullstack`: Full-stack development focus
- `frontend`: Frontend/UX development focus
- `mobile`: Mobile development focus

### Previewing Resumes
- Open any `.html` file in the `build` directory to preview in your browser
- Generated PDFs are also available in the `build` directory

## Tips
- Keep your main versions up to date with your latest experience
- Use the job-specific versions to highlight relevant experience for each position
- Preview both HTML and PDF versions before submitting
- The HTML preview is great for quick iterations during editing
- Store job descriptions to help track your application process and tailor future resumes
- Use job descriptions as reference for common requirements in your field

## Templates
The project includes different templates that can be used to style your resume differently:
- `templates/modern.md` - Clean, modern design
- `templates/classic.md` - Traditional resume format 