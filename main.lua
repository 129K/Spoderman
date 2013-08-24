local spodermanId 	= 123546727
local rbxAsset 		= "http://www.roblox.com/asset/?id="
local bodyParts = { }
local character	= game:GetService("Players").LocalPlayer.Character
local Create = assert(LoadLibrary("RbxUtility").Create)

function getRecursiveChildren(dir)
	for _, o in pairs(dir:GetChildren()) do
		table.insert(bodyParts, o)
		if #o:GetChildren() ~= 0 then
			getRecursiveChildren(o)
		end
	end
end

function onLoad()
	for _, o in pairs(bodyParts) do
		if o:IsA("Part") then
			o.Transparency = 1
		end
	end
	pcall(function() character.Head.face:Destroy() end)
	Create "BillboardGui" {
		Parent = character.Torso;
		Adornee = character.Torso;
		Size = UDim2.new(10, 0, 10, 0);
		Create "ImageLabel" {
			Image = rbxAsset .. spodermanId;
			BackgroundTransparency = 1;
			Size = UDim2.new(1, 0, 1, 0);
		}
	}
end

getRecursiveChildren(character)
onLoad()
