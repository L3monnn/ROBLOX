local commonProps = {
    ["Frame"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "SelectionImageObject", "Size", "SizeConstraint", "Visible", "ZIndex"
    },

    ["TextLabel"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "Size", "SizeConstraint", "Visible", "ZIndex",
        "Text", "Font", "FontFace", "TextSize", "TextColor3", "TextStrokeColor3", 
        "TextStrokeTransparency", "TextTransparency", "TextWrapped", "TextScaled", 
        "TextXAlignment", "TextYAlignment", "LineHeight", "RichText", 
        "MaxVisibleGraphemes", "TextTruncate", "TextDirection"
    },

    ["TextButton"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "Size", "SizeConstraint", "Visible", "ZIndex",
        "Text", "Font", "FontFace", "TextSize", "TextColor3", "TextStrokeColor3", 
        "TextStrokeTransparency", "TextTransparency", "TextWrapped", "TextScaled", 
        "TextXAlignment", "TextYAlignment", "LineHeight", "RichText", "AutoButtonColor", 
        "Selected", "Style", "Modal"
    },

    ["TextBox"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "Size", "SizeConstraint", "Visible", "ZIndex",
        "Text", "Font", "FontFace", "TextSize", "TextColor3", "TextStrokeColor3", 
        "TextStrokeTransparency", "TextTransparency", "TextWrapped", "TextScaled", 
        "TextXAlignment", "TextYAlignment", "ClearTextOnFocus", "MultiLine", 
        "PlaceholderColor3", "PlaceholderText", "TextEditable", "ShowNativeInput"
    },

    ["ImageLabel"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "Size", "SizeConstraint", "Visible", "ZIndex",
        "Image", "ImageColor3", "ImageTransparency", "ImageRectOffset", "ImageRectSize", 
        "ScaleType", "SliceCenter", "SliceScale", "TileSize", "ResampleMode"
    },

    ["ImageButton"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "Size", "SizeConstraint", "Visible", "ZIndex",
        "Image", "ImageColor3", "ImageTransparency", "ImageRectOffset", "ImageRectSize", 
        "ScaleType", "SliceCenter", "SliceScale", "TileSize", "ResampleMode",
        "AutoButtonColor", "Selected", "HoverImage", "PressedImage", "Modal"
    },

    ["ScrollingFrame"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "Size", "SizeConstraint", "Visible", "ZIndex",
        "AutomaticCanvasSize", "CanvasSize", "CanvasPosition", "HorizontalScrollBarInset", 
        "VerticalScrollBarInset", "VerticalScrollBarPosition", "ScrollBarThickness", 
        "ScrollBarImageColor3", "ScrollBarImageTransparency", "ScrollingDirection", 
        "ScrollingEnabled", "ElasticBehavior", "ScrollBarPadding"
    },

    ["CanvasGroup"] = {
        "Name", "Parent", "Active", "AnchorPoint", "AutomaticSize", "BackgroundColor3", 
        "BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", 
        "ClipsDescendants", "Interactable", "LayoutOrder", "Position", "Rotation", 
        "Selectable", "Size", "SizeConstraint", "Visible", "ZIndex",
        "GroupColor3", "GroupTransparency"
    },

    ["ViewportFrame"] = {
        "Name", "Parent", "Active", "AnchorPoint", "BackgroundColor3", "BackgroundTransparency", 
        "BorderSizePixel", "Position", "Size", "Visible", "ZIndex",
        "Ambient", "LightColor", "LightDirection", "CurrentCamera", "ImageTransparency", "ImageColor3"
    },

    ["VideoFrame"] = {
        "Name", "Parent", "Active", "Position", "Size", "Visible", "ZIndex",
        "Video", "Looped", "Playing", "TimePosition", "Volume"
    },

    ["ScreenGui"] = {
        "Name", "Parent", "DisplayOrder", "Enabled", "IgnoreGuiInset", 
        "ResetOnSpawn", "ZIndexBehavior"
    },

    ["BillboardGui"] = {
        "Name", "Parent", "Active", "Adornee", "AlwaysOnTop", "Brightness", 
        "ClipsDescendants", "DistanceLowerLimit", "DistanceStep", "DistanceUpperLimit", 
        "Enabled", "ExtentsOffset", "ExtentsOffsetWorldSpace", "LightInfluence", 
        "MaxDistance", "PlayerToHideFrom", "ResetOnSpawn", "Size", "SizeOffset", "StudsOffset", "StudsOffsetWorldSpace"
    },

    ["SurfaceGui"] = {
        "Name", "Parent", "Active", "Adornee", "AlwaysOnTop", "Brightness", 
        "CanvasSize", "ClipsDescendants", "Enabled", "Face", "LightInfluence", 
        "PixelsPerStud", "SizingMode", "ZOffset"
    },

    ["UIListLayout"] = {
        "Name", "Parent", "FillDirection", "HorizontalAlignment", "SortOrder", 
        "VerticalAlignment", "Padding", "ItemLineAlignment"
    },

    ["UIGridLayout"] = {
        "Name", "Parent", "CellPadding", "CellSize", "FillDirection", 
        "FillDirectionMaxCells", "HorizontalAlignment", "SortOrder", 
        "StartCorner", "VerticalAlignment"
    },

    ["UIPageLayout"] = {
        "Name", "Parent", "Animated", "Circular", "EasingDirection", "EasingStyle", 
        "FillDirection", "HorizontalAlignment", "Padding", "SortOrder", 
        "TweenTime", "VerticalAlignment", "GamepadInputEnabled", "ScrollWheelInputEnabled", "TouchInputEnabled"
    },

    ["UICorner"] = { "Name", "Parent", "CornerRadius" },

    ["UIStroke"] = { "Name", "Parent", "Color", "Enabled", "Thickness", "Transparency", "ApplyStrokeMode", "LineJoinMode" },

    ["UIGradient"] = { "Name", "Parent", "Color", "Enabled", "Offset", "Rotation", "Transparency" },

    ["UIPadding"] = { "Name", "Parent", "PaddingBottom", "PaddingLeft", "PaddingRight", "PaddingTop" },

    ["UIScale"] = { "Name", "Parent", "Scale" },

    ["UIAspectRatioConstraint"] = { "Name", "Parent", "AspectRatio", "AspectType", "DominantAxis" },

    ["UISizeConstraint"] = { "Name", "Parent", "MaxSize", "MinSize" },

    ["UITextSizeConstraint"] = { "Name", "Parent", "MaxTextSize", "MinTextSize" }
}

local function escapeString(str)
	return ("%q"):format(str)
end

local function serializeProperties(obj)
	local props = {}
	local classProperties = commonProps[obj.ClassName]

	if not classProperties then
		return props
	end

	for _, prop in ipairs(classProperties) do
		local val = obj[prop]
		
		if val == nil then
			continue
		end

		if typeof(val) == "string" then
			props[prop] = escapeString(val)
		elseif typeof(val) == "number" or typeof(val) == "boolean" then
			props[prop] = tostring(val)
		elseif typeof(val) == "NumberSequence" then
    		local nStrings = {}
			
    		for _, kp in ipairs(val.Keypoints) do
        		table.insert(nStrings, string.format("NumberSequenceKeypoint.new(%f, %f)", kp.Time, kp.Value))
    		end

    		props[prop] = "NumberSequence.new({" .. table.concat(nStrings, ", ") .. "})"
		elseif typeof(val) == "ColorSequence" then
			local keypointStrings = {}
    
			for i, keypoint in pairs(val.Keypoints) do
				local formattedKp = string.format("ColorSequenceKeypoint.new(%f, Color3.new(%f, %f, %f))", keypoint.Time, keypoint.Value.R, keypoint.Value.G, keypoint.Value.B)
				table.insert(keypointStrings, formattedKp)
			end
			
			props[prop] = "ColorSequence.new({" .. table.concat(keypointStrings, ", ") .. "})"
		elseif typeof(val) == "Color3" then
			props[prop] = string.format("Color3.new(%f, %f, %f)", val.R, val.G, val.B)
		elseif typeof(val) == "Vector2" then
			props[prop] = string.format("Vector2.new(%f, %f)", val.X, val.Y)
		elseif typeof(val) == "Vector3" then
			props[prop] = string.format("Vector3.new(%f, %f, %f)", val.X, val.Y, val.Z)
		elseif typeof(val) == "UDim" then
			props[prop] = string.format("UDim.new(%f, %d)", val.Scale, val.Offset)
		elseif typeof(val) == "UDim2" then
			props[prop] = string.format("UDim2.new(%f, %d, %f, %d)", val.X.Scale, val.X.Offset, val.Y.Scale, val.Y.Offset)
		elseif typeof(val) == "EnumItem" then
    		props[prop] = tostring(val)
		end
	end

	return props
end

local function serializeGuiObject(obj, indent)
	indent = indent or ""
	local lines = {}
	local className = obj.ClassName
	local varName = obj.Name:gsub("%W", "_")
	table.insert(lines, indent .. string.format("local %s = Instance.new(%q)", varName, className))
	local props = serializeProperties(obj)
	for prop, val in pairs(props) do
		table.insert(lines, indent .. string.format("%s.%s = %s", varName, prop, val))
	end
	for _, child in ipairs(obj:GetChildren()) do
		local childLines = serializeGuiObject(child, indent .. "\t")
		for _, line in ipairs(childLines) do
			table.insert(lines, line)
		end
		table.insert(lines, indent .. string.format("%s.Parent = %s", child.Name:gsub("%W", "_"), varName))
	end
	return lines
end

local function convertGuiToLua(gui)
	local lines = serializeGuiObject(gui)
	table.insert(lines, "return " .. gui.Name:gsub("%W", "_"))
	return table.concat(lines, "\n")
end

return convertGuiToLua
