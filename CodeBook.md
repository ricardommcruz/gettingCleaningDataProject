# Code Book

The following is a quick description of the data set variables and their meaning.

This code book is valid for both files produced by the run_analysis.R script.
* fuci_har_dataset.txt
* fuci_har_dataset_summarised_means.txt

## Variables

| Column name                     | Description
|---------------------------------|-------------------------------------------------------------------
| Activity                        | The activity being performed while collecting the record's data
|---------------------------------|-------------------------------------------------------------------
| Subject                         | A code identifying the subject who performed the activity from which the data was collected
|---------------------------------|-------------------------------------------------------------------
| [source]-[mean()|std()]-[X|Y|Z] | All other columns follow this format, where 'source' indicates the device where the measurement has been taken followed by the indication of whether it is a mean or standard deviation and which of three dimensions it relates to
|---------------------------------|-------------------------------------------------------------------
