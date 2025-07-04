local Config = {}




Config.WantedLevel = 1  -- This is to set a wanted level after the fight if you want, it can be set from 0 to 5

Config.Dispatch = 'qs' -- You can change this to your dispatch or to false to disable it, the available dispatches: 'auto'; 'qs'; 'ps'; 'cd'

Config.PoliceJobs = { 'police', 'sheriff' } -- You can add police jobs in here, this is to select which jobs will get the dispatch call/signal, you can leave it as it is if you dont use the Config.Dispatch option

Config.BlackListJobs = { 'police', 'sheriff', 'ambulance' } -- these are the jobs which cant use the fighting services



return Config