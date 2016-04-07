# Provide default values for parameters.
class azuresdk::params {
  $tempfolder = 'c:/temp'

  $download_base_urls = {
    '2.6' => 'https://download.microsoft.com/download/7/4/8/74814E48-0AF7-416A-8109-0F201B921A98',
    '2.7' => 'https://download.microsoft.com/download/0/F/E/0FE64840-9806-4D3C-9C11-84B743162618',
    '2.8' => 'https://download.microsoft.com/download/D/E/B/DEB395C9-C875-47F3-96F7-55C9A8FCD869',
  }

  $authoring_tools_display_versions = {
    '2.6' => 'v2.6',
    '2.7' => 'v2.7.1',
    '2.8' => 'v2.8',
  }

  $dotnetlibraries_installer_guids = {
    '2.6' => '{E083D718-4414-45A6-B25B-7ADE4D483FD4}',
    '2.7' => '{CBF95044-8CCB-492A-B46C-87CE75325CAD}',
    '2.8' => '{4216CA86-CCF4-46BA-875D-079E3F93796C}',
  }

}
