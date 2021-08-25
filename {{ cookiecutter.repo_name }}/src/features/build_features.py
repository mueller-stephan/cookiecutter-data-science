import logging


def build_features(interim_filepath: str, processed_filepath: str) -> None:
    """Runs feature building scripts to turn clean data from (../interim) into
    processed data ready to be fed into a model.

    Args:
        input_filepath: directory of input files
        output_filepath: directory of output files
    """
    logger = logging.getLogger(__name__)
    logger.info("making final data set from raw data")
