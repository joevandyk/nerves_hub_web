defmodule NervesHub.Workers.OrgMetrics do
  use NervesHub.Worker,
    args: %{run_utc_time: "01:00:00.000000"},
    max_attempts: 5,
    queue: :create_org_metrics,
    schedule: "0 1 * * *"

  @impl true
  def run(%{args: %{"run_utc_time" => run_utc_time}}) do
    NervesHub.Accounts.create_org_metrics(run_utc_time)
  end
end