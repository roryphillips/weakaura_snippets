function()
  local beaconRefreshInterval = .1
  
  if not aura_env.last or aura_env.last < GetTime() - beaconRefreshInterval then
    aura_env.last = GetTime()
    
    local hasTargetTarget = UnitExists("focustarget")
    if hasTargetTarget then
      local aura = AuraUtil.FindAuraByName("Beacon of Light", "focustarget", "HELPFUL")
      if aura == nil then
        aura_env.shouldBeacon = true
      else
        aura_env.shouldBeacon = false
      end
    else
      aura_env.shouldBeacon = false
    end
  end
  
  return aura_env.shouldBeacon
end
