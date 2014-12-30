class ListingWorker < ::CarrierWave::Workers::ProcessAsset
  def error(job, exception)
    report_job_failure  # or whatever
  end
end
