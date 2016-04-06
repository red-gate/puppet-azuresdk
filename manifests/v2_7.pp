# Install Azure SDK 2.7
class azuresdk::v2_7(
  $tempfolder = $azuresdk::params::tempfolder
  ) inherits azuresdk::params {

  azuresdk::install {'Azure SDK 2.7':
    version    => '2.7',
    tempfolder => $tempfolder,
  }
}
