local RemoteEventsModule = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

type RemoteEventSignal = {
	Connect: (self: RemoteEventSignal, callback: (...any) -> ()) -> RBXScriptConnection,
}

type RemoteEvent = {
	FireServer: (self: RemoteEvent, ...any) -> (),
	FireClient: (self: RemoteEvent, ...any) -> (),
	OnClientEvent: RemoteEventSignal,
	OnServerEvent: RemoteEventSignal,
}

local function GetRemoteEvent(remoteEventName: string): RemoteEvent
	if RunService:IsClient() then
		return ReplicatedStorage.RemoteEvents:WaitForChild(remoteEventName) :: RemoteEvent
	end
	
	return ReplicatedStorage.RemoteEvents[remoteEventName] :: RemoteEvent
end

--Adicione os seus remote events aqui
RemoteEventsModule.ExemploEvent = GetRemoteEvent("ExemploEvent")


return RemoteEventsModule