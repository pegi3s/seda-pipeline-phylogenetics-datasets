# Preparing datasets for large scale phylogenetic analyses [![license](https://img.shields.io/github/license/pegi3s/seda-pipeline-phylogenetics-datasets?style=flat-square)](https://github.com/pegi3s/seda-pipeline-phylogenetics-datasets) [![dockerhub](https://img.shields.io/badge/Docker%20Hub-7289da.svg?style=flat-square)](https://hub.docker.com/r/pegi3s/seda-pipeline-phylogenetics-datasets)  [![github](https://img.shields.io/badge/GitHub-7289da.svg?style=flat-square)](https://github.com/pegi3s/seda-pipeline-phylogenetics-datasets)

A [SEDA](https://www.sing-group.org/seda/) pipeline created in [Compi](https://www.sing-group.org/compi/) that implements the ["Preparing datasets for large scale phylogenetic analyses"](https://www.sing-group.org/seda/manual/protocols.html#preparing-datasets-for-large-scale-phylogenetic-analyses) SEDA-based protocol. Created using the [SEDA-Compi pipelines framework](https://github.com/sing-group/seda-compi-pipelines).

This protocol shows how to retrieve and process a large amount of coding sequences of a given gene. The portrayed example concerns GULO, a gene that encodes for the protein that catalyzes the final oxidation step of the Vitamin C biosynthetic pathway in animals (http://doi.org/10.7554/eLife.06369).

# Quick-start: running the pipeline with sample data

It is recommended to run this quick-start example to check that everything works fine:

1. Download [this ZIP](https://static.sing-group.org/software/pegi3s/seda-pipeline-phylogenetics-datasets/sample-working-dir.zip) and decompress it. The path where it is extracted will be referred as "working directory" (`/path/to/working_dir`).
2. Move to the working directory and run `./run.sh "$(pwd)"`. This will run the entire pipeline with eight input files, 4 from RefSeq and 4 from GenBank.

# Using real data from NCBI

After running the quick-start, remove the `output` folder that was created in the working directory.

Then, download the input data as explained [here](https://www.sing-group.org/seda/manual/protocols.html#step-1-download-input-data). GenBank data must be placed in `input/rename-ncbi_1` and RefSeq data in `input/rename-ncbi_2`.

After running the pipeline, you can:

- Edit the `compi.params` to change the batch size of the four "NCBI rename" (`rename-ncbi`) and "BLAST" (`blast`) operations. The batch size is the maximum number of files each SEDA command will process at the same time. If no provided, it means that the command will attempt to process all files at the same time. The provided values are appropriate in most cases (workstations with 8-16GB of RAM). For higher values, the amount of RAM memory that SEDA can use must be increased.
- Change the amount of RAM memory that SEDA can use by exporting the variable `SEDA_JAVA_MEMORY`. This must be done before running the `run.sh` script (e.g. `export SEDA_JAVA_MEMORY="-Xmx8G"`).
- Reduce disk usage (at the cost of increasing running time) by creating files `params/rename-ncbi_1.cliParams` and `params/rename-ncbi_2.cliParams` with the following contents `--output-gzip`. This way, the outputs of such operations will be compressed using GZIP and therefore reducing the amount of disk space they require.

And now, the full pipeline can be executed with `./run.sh "$(pwd)"`.

To run specific tasks an additional parameter can be passed to the `run.sh` script: `./run.sh "$(pwd)" "--single-task rename-ncb_1"` or `./run.sh "$(pwd)" "--until merge_3"`.

# Contributors

<a href="https://github.com/pegi3s/seda-pipeline-phylogenetics-datasets/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=pegi3s/seda-pipeline-phylogenetics-datasets" />
</a>

<sup>Made with [contrib.rocks](https://contrib.rocks).</sup>