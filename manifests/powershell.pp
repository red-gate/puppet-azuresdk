# Install the Powershell Azure module
class azuresdk::powershell(
  $version = '1.3.0',
  $tempfolder = $azuresdk::params::tempfolder
  ) inherits azuresdk::params {

  require archive

  $month = $::azuresdk::params::powershellmodule_months[$version]
  $year = $::azuresdk::params::powershellmodule_years[$version]

  ensure_resource('file', $tempfolder, { ensure => directory })

  # Install the Azure powershell cmdlets.
  archive { "${tempfolder}/azure-powershell.${version}.msi":
    source  => "https://github.com/Azure/azure-powershell/releases/download/v${version}-${month}${year}/azure-powershell.${version}.msi",
    require => File[$tempfolder],
  }
  ->
  package { "Microsoft Azure PowerShell - ${month} ${year}":
    source          => "${tempfolder}/azure-powershell.${version}.msi",
    install_options => ['/norestart'],
  }
}
