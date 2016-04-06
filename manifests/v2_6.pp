# Install Azure SDK 2.6
class azuresdk::v2_6(
  $tempfolder = $azuresdk::params::tempfolder
  ) inherits azuresdk::params {

  azuresdk::install {'Azure SDK 2.6':
    version    => '2.6',
    tempfolder => $tempfolder,
  }
}
