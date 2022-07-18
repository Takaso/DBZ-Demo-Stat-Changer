getgenv().key = game:GetService("UserInputService");

function Reset()
spawn(function ()
    game:GetService("ReplicatedStorage").RemoteEvents.ResetStatPoints:FireServer()
end)
end


function notify(title,content,duration,...)
    game.StarterGui:SetCore("SendNotification", {
      Title = title;
      Text = content;
      Icon = "";
      Duration = duration;
    });
  end

function StatPoint(stat, amount, number)
spawn(function ()
    local args = {
        [1] = stat,
        [2] = number
    };
    for v=0, amount do
        game:GetService("ReplicatedStorage").RemoteEvents.AttemptIncrementStatPoint:FireServer(unpack(args));
        wait()
    end
end)
end

-- Strenght, MaxHealth, KiPower, KiMax, StaminaMax, Speed

notify("DBZ Demo Stat Script", "Made by Takaso,\nE : Atk - Z : ATK-HP - X : HP\nV : KI - N : KI-HP", 5);


key.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.E then
		Reset();
        StatPoint("Strength", 7, 100);
        notify("DBZ Demo Stat Script", "Updated ATK");
    elseif input.KeyCode == Enum.KeyCode.Z then
        Reset();
        StatPoint("Strength", 3, 100);
        StatPoint("MaxHealth", 4, 100);
        notify("DBZ Demo Stat Script", "Updated ATK-HP");
    elseif input.KeyCode == Enum.KeyCode.X then
        Reset();
        StatPoint("MaxHealth", 7, 100);
        notify("DBZ Demo Stat Script", "Updated HP");
    elseif input.KeyCode == Enum.KeyCode.V then
        Reset();
        StatPoint("KiPower", 7, 100);
        notify("DBZ Demo Stat Script", "Updated KI");
    elseif input.KeyCode == Enum.KeyCode.N then
        Reset();
        StatPoint("KiPower", 3, 100);
        StatPoint("MaxHealth", 4, 100);
        notify("DBZ Demo Stat Script", "Updated KI-HP");
    end
end)
