for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "Linux_UI" then
        v:Destroy()
    end
end

local Linux_UI = Instance.new("ScreenGui")
Linux_UI.Name = "Linux_UI"
Linux_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Linux_UI.Parent = game.CoreGui

local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function Library:Create(table)
    local windowName = table.Name
    local uiSize = UDim2.fromOffset(500, 350)
    local themeName = table.Theme or "Blue"
    local transparency = table.Transparency or false

    local themes = {
        Blue = {
            MainBackground = Color3.fromRGB(18, 18, 18),
            TabContainerBackground = Color3.fromRGB(18, 18, 18),
            ContainerBackground = Color3.fromRGB(18, 18, 18),
            TitleLine = Color3.fromRGB(60, 60, 60),
            TitleText = Color3.fromRGB(255, 255, 255),
            TabNameText = Color3.fromRGB(255, 255, 255),
            TabButtonBackground = Color3.fromRGB(18, 18, 18),
            TabButtonHover = Color3.fromRGB(60, 60, 60),
            TabButtonActive = Color3.fromRGB(0, 120, 255),
            TabIcon = Color3.fromRGB(255, 255, 255),
            TabIconHover = Color3.fromRGB(255, 255, 255),
            TabIconActive = Color3.fromRGB(255, 255, 255),
            TabText = Color3.fromRGB(255, 255, 255),
            TabTextHover = Color3.fromRGB(255, 255, 255),
            TabTextActive = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(24, 24, 24),
            ElementHover = Color3.fromRGB(60, 60, 60),
            ElementActive = Color3.fromRGB(70, 70, 70),
            ElementText = Color3.fromRGB(255, 255, 255),
            ElementTextHover = Color3.fromRGB(255, 255, 255),
            SliderTrack = Color3.fromRGB(50, 50, 50),
            SliderFill = Color3.fromRGB(0, 120, 255),
            ToggleOff = Color3.fromRGB(0, 120, 255),
            ToggleOn = Color3.fromRGB(255, 255, 255),
            ToggleKnobOff = Color3.fromRGB(255, 255, 255),
            ToggleKnobOn = Color3.fromRGB(0, 120, 255),
            DropdownListBackground = Color3.fromRGB(25, 25, 25),
            DropdownOptionBackground = Color3.fromRGB(25, 25, 25),
            DropdownOptionHover = Color3.fromRGB(70, 70, 70),
            TextboxInputBackground = Color3.fromRGB(33, 33, 33),
            CloseButtonIcon = Color3.fromRGB(255, 255, 255)
        }
    }

    local theme = themes[themeName] or themes.Blue

    local main = Instance.new("Frame")
    local uICorner = Instance.new("UICorner")
    local titleBar = Instance.new("Frame")
    local logo = Instance.new("ImageLabel")
    local title = Instance.new("TextLabel")
    local minimizeButton = Instance.new("ImageButton")
    local closeButton = Instance.new("ImageButton")
    local contentFrame = Instance.new("Frame")
    local titleLine = Instance.new("Frame")
    local tabContainer = Instance.new("ScrollingFrame")
    local uICorner1 = Instance.new("UICorner")
    local uIListLayout = Instance.new("UIListLayout")
    local uIPadding = Instance.new("UIPadding")

    main.Name = "main"
    main.BackgroundColor3 = theme.MainBackground
    main.BackgroundTransparency = 0
    main.Position = UDim2.fromScale(0.5, 0.5)
    main.Size = uiSize
    main.Active = true
    main.Draggable = true
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.Parent = Linux_UI

    uICorner.CornerRadius = UDim.new(0, 8)
    uICorner.Parent = main

    titleBar.Name = "titleBar"
    titleBar.BackgroundTransparency = 1
    titleBar.Size = UDim2.fromOffset(500, 35)
    titleBar.Position = UDim2.fromOffset(0, 0)
    titleBar.Parent = main

    logo.Name = "logo"
    logo.Image = "rbxassetid://123819615141275"
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.fromOffset(8, 5)
    logo.Size = UDim2.fromOffset(22, 22)
    logo.Parent = titleBar

    title.Name = "title"
    title.Font = Enum.Font.GothamBold
    title.Text = windowName
    title.TextColor3 = theme.TitleText
    title.TextSize = 16
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromOffset(40, 9)
    title.Size = UDim2.fromOffset(200, 20)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar

    minimizeButton.Name = "minimizeButton"
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Size = UDim2.fromOffset(18, 18)
    minimizeButton.Position = UDim2.fromOffset(450, 9)
    minimizeButton.Image = "rbxassetid://10734895698"
    minimizeButton.ImageColor3 = theme.CloseButtonIcon
    minimizeButton.Parent = titleBar

    closeButton.Name = "closeButton"
    closeButton.BackgroundTransparency = 1
    closeButton.Size = UDim2.fromOffset(20, 20)
    closeButton.Position = UDim2.fromOffset(475, 9)
    closeButton.Image = "rbxassetid://10747384394"
    closeButton.ImageColor3 = theme.CloseButtonIcon
    closeButton.Parent = titleBar

    contentFrame.Name = "contentFrame"
    contentFrame.BackgroundTransparency = 1
    contentFrame.Position = UDim2.fromOffset(0, 35)
    contentFrame.Size = UDim2.fromOffset(500, 315)
    contentFrame.Parent = main

    titleLine.Name = "titleLine"
    titleLine.BackgroundColor3 = theme.TitleLine
    titleLine.BackgroundTransparency = 0
    titleLine.Position = UDim2.fromOffset(8, 0)
    titleLine.Size = UDim2.fromOffset(485, 1)
    titleLine.BorderSizePixel = 0
    titleLine.Parent = contentFrame

    tabContainer.Name = "tabContainer"
    tabContainer.BackgroundColor3 = theme.TabContainerBackground
    tabContainer.BackgroundTransparency = transparency and 0.2 or 0
    tabContainer.Position = UDim2.fromOffset(15, 15)
    tabContainer.Size = UDim2.fromOffset(110, 285)
    tabContainer.ScrollBarThickness = 0
    tabContainer.ScrollingDirection = Enum.ScrollingDirection.Y
    tabContainer.Active = true
    tabContainer.CanvasSize = UDim2.fromOffset(0, 0)
    tabContainer.Parent = contentFrame

    uICorner1.CornerRadius = UDim.new(0, 6)
    uICorner1.Parent = tabContainer

    uIListLayout.Padding = UDim.new(0, 5)
    uIListLayout.FillDirection = Enum.FillDirection.Vertical
    uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout.Parent = tabContainer

    uIPadding.PaddingTop = UDim.new(0, 5)
    uIPadding.PaddingLeft = UDim.new(0, 5)
    uIPadding.Parent = tabContainer

    local function updateTabCanvasSize()
        local contentHeight = uIListLayout.AbsoluteContentSize.Y
        tabContainer.CanvasSize = UDim2.fromOffset(0, contentHeight)
    end

    tabContainer.ChildAdded:Connect(updateTabCanvasSize)
    tabContainer:GetPropertyChangedSignal("CanvasPosition"):Connect(updateTabCanvasSize)

    local tabHandler = {}
    local isMinimized = false

    function tabHandler:Exit()
        Linux_UI:Destroy()
    end

    closeButton.MouseButton1Click:Connect(function()
        tabHandler:Exit()
    end)

    minimizeButton.MouseButton1Click:Connect(function()
        if isMinimized then
            contentFrame.Visible = true
            TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = uiSize}):Play()
            minimizeButton.Image = "rbxassetid://10734895698"
            isMinimized = false
        else
            TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(500, 35)}):Play()
            contentFrame.Visible = false
            minimizeButton.Image = "rbxassetid://10734886735"
            isMinimized = true
        end
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
        if gameProcessedEvent then return end
        local platform = UserInputService:GetPlatform()
        local isPC = platform == Enum.Platform.Windows or platform == Enum.Platform.OSX or platform == Enum.Platform.Linux
        if isPC and input.KeyCode == Enum.KeyCode.K then
            tabHandler:Exit()
        end
    end)

    function tabHandler:Tab(name, iconId)
        local main1 = Instance.new("TextButton")
        local icon = Instance.new("ImageLabel")
        local textLabel = Instance.new("TextLabel")
        local uICornerTab = Instance.new("UICorner")
        local container = Instance.new("Frame")
        local uICorner2 = Instance.new("UICorner")
        local tabNameLabel = Instance.new("TextLabel")
        local holder = Instance.new("ScrollingFrame")
        local uIPadding1 = Instance.new("UIPadding")
        local uIListLayout1 = Instance.new("UIListLayout")

        main1.Name = name
        main1.Font = Enum.Font.Gotham
        main1.Text = name
        main1.TextColor3 = theme.TabText
        main1.TextSize = 14
        main1.TextTransparency = 0
        main1.BackgroundColor3 = theme.TabButtonBackground
        main1.BackgroundTransparency = transparency and 0.2 or 0
        main1.Size = UDim2.fromOffset(100, 35)
        main1.AutoButtonColor = false
        main1.TextXAlignment = Enum.TextXAlignment.Left
        main1.Parent = tabContainer

        icon.Name = "icon"
        icon.Image = iconId or "rbxassetid://10709752996"
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.fromOffset(5, 9)
        icon.Size = UDim2.fromOffset(18, 18)
        icon.ImageColor3 = theme.TabIcon
        icon.Parent = main1

        textLabel.Name = "textLabel"
        textLabel.Text = name
        textLabel.Font = Enum.Font.Gotham
        textLabel.TextColor3 = theme.TabText
        textLabel.TextSize = 14
        textLabel.BackgroundTransparency = 1
        textLabel.Position = UDim2.fromOffset(30, 0)
        textLabel.Size = UDim2.fromOffset(65, 35)
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = main1

        main1.Text = ""

        uICornerTab.CornerRadius = UDim.new(0, 4)
        uICornerTab.Parent = main1

        container.Name = "container"
        container.BackgroundColor3 = theme.ContainerBackground
        container.BackgroundTransparency = 0.4
        container.Position = UDim2.fromOffset(130, 15)
        container.Size = UDim2.fromOffset(360, 285)
        container.Visible = false
        container.Parent = contentFrame

        uICorner2.CornerRadius = UDim.new(0, 6)
        uICorner2.Parent = container

        tabNameLabel.Name = "tabNameLabel"
        tabNameLabel.Font = Enum.Font.GothamBold
        tabNameLabel.Text = name
        tabNameLabel.TextColor3 = theme.TabNameText
        tabNameLabel.TextSize = 16
        tabNameLabel.BackgroundTransparency = 1
        tabNameLabel.Position = UDim2.fromOffset(10, 3)
        tabNameLabel.Size = UDim2.fromOffset(340, 20)
        tabNameLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabNameLabel.Parent = container

        holder.ScrollBarThickness = 0
        holder.ScrollingDirection = Enum.ScrollingDirection.Y
        holder.Active = true
        holder.BackgroundTransparency = 1
        holder.Position = UDim2.fromOffset(10, 30)
        holder.Size = UDim2.fromOffset(340, 245)
        holder.CanvasSize = UDim2.fromOffset(0, 0)
        holder.Parent = container

        uIPadding1.PaddingLeft = UDim.new(0, 0)
        uIPadding1.PaddingTop = UDim.new(0, 0)
        uIPadding1.Parent = holder

        uIListLayout1.Padding = UDim.new(0, 5)
        uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
        uIListLayout1.Parent = holder

        local function updateCanvasSize()
            local contentHeight = uIListLayout1.AbsoluteContentSize.Y
            holder.CanvasSize = UDim2.fromOffset(0, contentHeight)
        end

        holder.ChildAdded:Connect(updateCanvasSize)
        holder:GetPropertyChangedSignal("CanvasPosition"):Connect(updateCanvasSize)

        main1.MouseButton1Click:Connect(function()
            for _, v in pairs(contentFrame:GetChildren()) do
                if v.Name == "container" then
                    v.Visible = false
                end
            end
            for _, v in pairs(tabContainer:GetChildren()) do
                if v:IsA("TextButton") then
                    v.BackgroundColor3 = theme.TabButtonBackground
                    v.BackgroundTransparency = transparency and 0.2 or 0
                    v:FindFirstChild("icon").ImageColor3 = theme.TabIcon
                    v:FindFirstChild("textLabel").TextTransparency = 0
                    v:FindFirstChild("textLabel").TextColor3 = theme.TabText
                end
            end
            container.Visible = true
            main1.BackgroundColor3 = theme.TabButtonActive
            main1.BackgroundTransparency = transparency and 0.2 or 0
            icon.ImageColor3 = theme.TabIconActive
            textLabel.TextTransparency = 0
            textLabel.TextColor3 = theme.TabTextActive
        end)

        local ElementHandler = {}

        function ElementHandler:Section(text)
            local sectionLabel = Instance.new("TextLabel")
            sectionLabel.Font = Enum.Font.GothamBold
            sectionLabel.Text = text
            sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            sectionLabel.TextSize = 16
            sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            sectionLabel.BackgroundTransparency = 1
            sectionLabel.Position = UDim2.fromOffset(0, 0)
            sectionLabel.Size = UDim2.fromOffset(340, 35)
            sectionLabel.Parent = holder
        end

        function ElementHandler:Label(text)
            local label = Instance.new("Frame")
            local uICorner3 = Instance.new("UICorner")
            local textLabel = Instance.new("TextLabel")

            label.BackgroundColor3 = theme.ElementBackground
            label.BackgroundTransparency = 0
            label.Position = UDim2.fromOffset(0, 0)
            label.Size = UDim2.fromOffset(340, 35)
            label.Parent = holder

            uICorner3.CornerRadius = UDim.new(0, 4)
            uICorner3.Parent = label

            textLabel.Font = Enum.Font.Gotham
            textLabel.Text = text
            textLabel.TextColor3 = theme.ElementText
            textLabel.TextSize = 14
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.BackgroundTransparency = 1
            textLabel.Position = UDim2.fromOffset(10, 0)
            textLabel.Size = UDim2.fromOffset(320, 35)
            textLabel.Parent = label
        end

        function ElementHandler:Button(text, callback, iconId)
            text = text or "Button"
            callback = callback or function() end

            local button = Instance.new("TextButton")
            local uICorner12 = Instance.new("UICorner")
            local textLabel5 = Instance.new("TextLabel")
            local icon = Instance.new("ImageLabel")

            button.BackgroundColor3 = theme.ElementBackground
            button.BackgroundTransparency = 0
            button.Position = UDim2.fromOffset(0, 0)
            button.Size = UDim2.fromOffset(340, 35)
            button.Text = ""
            button.AutoButtonColor = false
            button.Parent = holder

            uICorner12.CornerRadius = UDim.new(0, 4)
            uICorner12.Parent = button

            textLabel5.Font = Enum.Font.Gotham
            textLabel5.Text = text
            textLabel5.TextColor3 = theme.ElementText
            textLabel5.TextSize = 14
            textLabel5.TextXAlignment = Enum.TextXAlignment.Left
            textLabel5.BackgroundTransparency = 1
            textLabel5.Position = UDim2.fromOffset(10, 0)
            textLabel5.Size = UDim2.fromOffset(300, 35)
            textLabel5.Parent = button

            icon.Name = "icon"
            icon.Image = iconId or "rbxassetid://117608025522073"
            icon.BackgroundTransparency = 1
            icon.Position = UDim2.fromOffset(315, 9)
            icon.Size = UDim2.fromOffset(18, 18)
            icon.ImageColor3 = theme.TabIcon
            icon.Parent = button

            button.MouseEnter:Connect(function()
                button.BackgroundColor3 = theme.ElementHover
                button.BackgroundTransparency = 0
                icon.ImageColor3 = theme.TabIconHover
            end)

            button.MouseLeave:Connect(function()
                button.BackgroundColor3 = theme.ElementBackground
                button.BackgroundTransparency = 0
                icon.ImageColor3 = theme.TabIcon
            end)

            button.MouseButton1Click:Connect(callback)
        end

        function ElementHandler:Slider(text, default, min, max, callback)
            text = text or "Slider"
            default = default or 0
            min = min or 0
            max = max or 100
            callback = callback or function() end

            local slider = Instance.new("Frame")
            local uICorner4 = Instance.new("UICorner")
            local textLabel1 = Instance.new("TextLabel")
            local textLabel2 = Instance.new("TextLabel")
            local frame = Instance.new("Frame")
            local uICorner5 = Instance.new("UICorner")
            local frame1 = Instance.new("Frame")
            local uICorner6 = Instance.new("UICorner")
            local knob = Instance.new("TextButton")
            local uICornerKnob = Instance.new("UICorner")

            slider.BackgroundColor3 = theme.ElementBackground
            slider.BackgroundTransparency = 0
            slider.Position = UDim2.fromOffset(0, 0)
            slider.Size = UDim2.fromOffset(340, 35)
            slider.Parent = holder

            uICorner4.CornerRadius = UDim.new(0, 4)
            uICorner4.Parent = slider

            textLabel1.Font = Enum.Font.Gotham
            textLabel1.Text = text
            textLabel1.TextColor3 = theme.ElementText
            textLabel1.TextSize = 14
            textLabel1.TextXAlignment = Enum.TextXAlignment.Left
            textLabel1.BackgroundTransparency = 1
            textLabel1.Position = UDim2.fromOffset(10, 0)
            textLabel1.Size = UDim2.fromOffset(320, 15)
            textLabel1.Parent = slider

            textLabel2.Font = Enum.Font.Gotham
            textLabel2.Text = tostring(default)
            textLabel2.TextColor3 = theme.ElementText
            textLabel2.TextSize = 14
            textLabel2.BackgroundTransparency = 1
            textLabel2.Position = UDim2.fromOffset(10, 0)
            textLabel2.Size = UDim2.fromOffset(320, 15)
            textLabel2.TextXAlignment = Enum.TextXAlignment.Right
            textLabel2.Parent = slider

            frame.BackgroundColor3 = theme.SliderTrack
            frame.BackgroundTransparency = 0
            frame.Position = UDim2.fromOffset(10, 20)
            frame.Size = UDim2.fromOffset(320, 5)
            frame.Parent = slider

            uICorner5.CornerRadius = UDim.new(0, 3)
            uICorner5.Parent = frame

            frame1.BackgroundColor3 = theme.SliderFill
            frame1.BackgroundTransparency = 0
            frame1.Position = UDim2.fromOffset(0, 0)
            frame1.Size = UDim2.fromOffset(((default - min) / (max - min)) * 320, 5)
            frame1.Parent = frame

            uICorner6.CornerRadius = UDim.new(0, 3)
            uICorner6.Parent = frame1

            knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            knob.Size = UDim2.fromOffset(14, 14)
            knob.Position = UDim2.fromScale(((default - min) / (max - min)), 0.5)
            knob.AnchorPoint = Vector2.new(0.5, 0.5)
            knob.Text = ""
            knob.AutoButtonColor = false
            knob.Parent = frame

            uICornerKnob.CornerRadius = UDim.new(0, 12)
            uICornerKnob.Parent = knob

            local dragging = false

            knob.MouseButton1Down:Connect(function()
                dragging = true
                slider.BackgroundColor3 = theme.ElementActive
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                    slider.BackgroundColor3 = theme.ElementBackground
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local pos = input.Position.X
                    local percentage = math.clamp((pos - frame.AbsolutePosition.X) / frame.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + (max - min) * percentage)
                    textLabel2.Text = tostring(value)
                    frame1.Size = UDim2.fromOffset(percentage * 320, 5)
                    knob.Position = UDim2.fromScale(percentage, 0.5)
                    callback(value)
                end
            end)
        end

        function ElementHandler:Toggle(text, default, callback)
            text = text or "Toggle"
            default = default or false
            callback = callback or function() end

            local toggle1 = Instance.new("TextButton")
            local uICorner9 = Instance.new("UICorner")
            local textLabel4 = Instance.new("TextLabel")
            local toggleFrame = Instance.new("Frame")
            local uICorner10 = Instance.new("UICorner")
            local toggleKnob = Instance.new("Frame")
            local uICorner11 = Instance.new("UICorner")

            toggle1.BackgroundColor3 = theme.ElementBackground
            toggle1.BackgroundTransparency = 0
            toggle1.Position = UDim2.fromOffset(0, 0)
            toggle1.Size = UDim2.fromOffset(340, 35)
            toggle1.Text = ""
            toggle1.AutoButtonColor = false
            toggle1.Parent = holder

            uICorner9.CornerRadius = UDim.new(0, 4)
            uICorner9.Parent = toggle1

            textLabel4.Font = Enum.Font.Gotham
            textLabel4.Text = text
            textLabel4.TextColor3 = theme.ElementText
            textLabel4.TextSize = 14
            textLabel4.TextXAlignment = Enum.TextXAlignment.Left
            textLabel4.BackgroundTransparency = 1
            textLabel4.Position = UDim2.fromOffset(10, 0)
            textLabel4.Size = UDim2.fromOffset(300, 35)
            textLabel4.Parent = toggle1

            toggleFrame.BackgroundColor3 = default and theme.ToggleOn or theme.ToggleOff
            toggleFrame.BackgroundTransparency = 0
            toggleFrame.Position = UDim2.fromOffset(290, 9)
            toggleFrame.Size = UDim2.fromOffset(40, 20)
            toggleFrame.Parent = toggle1

            uICorner10.CornerRadius = UDim.new(1, 0)
            uICorner10.Parent = toggleFrame

            toggleKnob.BackgroundColor3 = default and theme.ToggleKnobOn or theme.ToggleKnobOff
            toggleKnob.Size = UDim2.fromOffset(18, 18)
            toggleKnob.Position = default and UDim2.fromOffset(21, 1) or UDim2.fromOffset(1, 1)
            toggleKnob.Parent = toggleFrame

            uICorner11.CornerRadius = UDim.new(1, 0)
            uICorner11.Parent = toggleKnob

            local tog = default

            toggle1.MouseButton1Click:Connect(function()
                tog = not tog
                callback(tog)
                if tog then
                    TweenService:Create(toggleKnob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(21, 1)}):Play()
                    toggleFrame.BackgroundColor3 = theme.ToggleOn
                    toggleKnob.BackgroundColor3 = theme.ToggleKnobOn
                else
                    TweenService:Create(toggleKnob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(1, 1)}):Play()
                    toggleFrame.BackgroundColor3 = theme.ToggleOff
                    toggleKnob.BackgroundColor3 = theme.ToggleKnobOff
                end
            end)
        end

        function ElementHandler:Textbox(text, callback)
            text = text or "Textbox"
            callback = callback or function() end

            local textbox = Instance.new("Frame")
            local uICorner13 = Instance.new("UICorner")
            local textLabel6 = Instance.new("TextLabel")
            local textBox = Instance.new("TextBox")
            local uICorner14 = Instance.new("UICorner")

            textbox.BackgroundColor3 = theme.ElementBackground
            textbox.BackgroundTransparency = 0
            textbox.Position = UDim2.fromOffset(0, 0)
            textbox.Size = UDim2.fromOffset(340, 35)
            textbox.Parent = holder

            uICorner13.CornerRadius = UDim.new(0, 4)
            uICorner13.Parent = textbox

            textLabel6.Font = Enum.Font.Gotham
            textLabel6.Text = text
            textLabel6.TextColor3 = theme.ElementText
            textLabel6.TextSize = 14
            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
            textLabel6.BackgroundTransparency = 1
            textLabel6.Position = UDim2.fromOffset(10, 0)
            textLabel6.Size = UDim2.fromOffset(260, 35)
            textLabel6.Parent = textbox

            textBox.Font = Enum.Font.SourceSans
            textBox.Text = ""
            textBox.TextColor3 = theme.ElementText
            textBox.TextSize = 14
            textBox.TextScaled = true
            textBox.TextTruncate = Enum.TextTruncate.AtEnd
            textBox.BackgroundColor3 = theme.TextboxInputBackground
            textBox.BackgroundTransparency = 0
            textBox.Position = UDim2.fromOffset(270, 7)
            textBox.Size = UDim2.fromOffset(60, 20)
            textBox.Parent = textbox

            uICorner14.CornerRadius = UDim.new(0, 4)
            uICorner14.Parent = textBox

            textBox.FocusLost:Connect(function()
                callback(textBox.Text)
            end)
        end

        function ElementHandler:Dropdown(text, options, default, callback)
            text = text or "Dropdown"
            options = options or {"Option 1", "Option 2", "Option 3"}
            default = default or options[1]
            callback = callback or function() end

            local dropdown = Instance.new("Frame")
            local uICorner = Instance.new("UICorner")
            local dropdownButton = Instance.new("TextButton")
            local dropdownLabel = Instance.new("TextLabel")
            local selectedLabel = Instance.new("TextLabel")
            local arrowIcon = Instance.new("ImageLabel")
            local dropdownList = Instance.new("ScrollingFrame")
            local uICornerList = Instance.new("UICorner")
            local listLayout = Instance.new("UIListLayout")
            local listPadding = Instance.new("UIPadding")
            local dropdownHolder = Instance.new("Frame")

            dropdown.BackgroundColor3 = theme.ElementBackground
            dropdown.BackgroundTransparency = 0
            dropdown.Position = UDim2.fromOffset(0, 0)
            dropdown.Size = UDim2.fromOffset(340, 35)
            dropdown.Parent = holder

            uICorner.CornerRadius = UDim.new(0, 4)
            uICorner.Parent = dropdown

            dropdownButton.BackgroundTransparency = 1
            dropdownButton.Size = UDim2.fromOffset(340, 35)
            dropdownButton.Text = ""
            dropdownButton.AutoButtonColor = false
            dropdownButton.Parent = dropdown

            dropdownLabel.Font = Enum.Font.Gotham
            dropdownLabel.Text = text
            dropdownLabel.TextColor3 = theme.ElementText
            dropdownLabel.TextSize = 14
            dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            dropdownLabel.BackgroundTransparency = 1
            dropdownLabel.Position = UDim2.fromOffset(10, 0)
            dropdownLabel.Size = UDim2.fromOffset(150, 35)
            dropdownLabel.Parent = dropdownButton

            selectedLabel.Font = Enum.Font.Gotham
            selectedLabel.Text = default
            selectedLabel.TextColor3 = theme.ElementText
            selectedLabel.TextSize = 14
            selectedLabel.TextXAlignment = Enum.TextXAlignment.Right
            selectedLabel.BackgroundTransparency = 1
            selectedLabel.Position = UDim2.fromOffset(200, 0)
            selectedLabel.Size = UDim2.fromOffset(110, 35)
            selectedLabel.Parent = dropdownButton

            arrowIcon.Name = "arrowIcon"
            arrowIcon.Image = "rbxassetid://10709767827"
            arrowIcon.BackgroundTransparency = 1
            arrowIcon.Position = UDim2.fromOffset(315, 9)
            arrowIcon.Size = UDim2.fromOffset(18, 18)
            arrowIcon.ImageColor3 = theme.TabIcon
            arrowIcon.Parent = dropdownButton

            dropdownList.BackgroundColor3 = theme.DropdownListBackground
            dropdownList.BackgroundTransparency = 0
            dropdownList.Position = UDim2.fromOffset(0, 35)
            dropdownList.Size = UDim2.fromOffset(340, 0)
            dropdownList.ScrollBarThickness = 0
            dropdownList.ScrollingDirection = Enum.ScrollingDirection.Y
            dropdownList.CanvasSize = UDim2.fromOffset(0, 0)
            dropdownList.Visible = false
            dropdownList.Parent = dropdown

            uICornerList.CornerRadius = UDim.new(0, 4)
            uICornerList.Parent = dropdownList

            listLayout.SortOrder = Enum.SortOrder.LayoutOrder
            listLayout.Padding = UDim.new(0, 2)
            listLayout.Parent = dropdownList

            listPadding.PaddingTop = UDim.new(0, 2)
            listPadding.PaddingBottom = UDim.new(0, 2)
            listPadding.Parent = dropdownList

            dropdownHolder.BackgroundTransparency = 1
            dropdownHolder.Size = UDim2.fromOffset(340, 35)
            dropdownHolder.Parent = holder

            local isOpen = false
            local maxHeight = 100
            local optionHeight = 30
            local totalHeight = #options * (optionHeight + listLayout.Padding.Offset) + listPadding.PaddingTop.Offset + listPadding.PaddingBottom.Offset
            local listHeight = math.min(totalHeight, maxHeight)

            dropdownList.CanvasSize = UDim2.fromOffset(0, totalHeight)

            local function updateListSize(opening)
                if opening then
                    dropdownList.Visible = true
                    TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(340, listHeight)}):Play()
                    for _, optionButton in ipairs(dropdownList:GetChildren()) do
                        if optionButton:IsA("TextButton") then
                            optionButton.BackgroundTransparency = 1
                            local optionLabel = optionButton:FindFirstChild("TextLabel")
                            if optionLabel then
                                optionLabel.TextTransparency = 1
                            end
                            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                            TweenService:Create(optionButton, tweenInfo, {BackgroundTransparency = 0}):Play()
                            if optionLabel then
                                TweenService:Create(optionLabel, tweenInfo, {TextTransparency = 0}):Play()
                            end
                        end
                    end
                else
                    for _, optionButton in ipairs(dropdownList:GetChildren()) do
                        if optionButton:IsA("TextButton") then
                            local optionLabel = optionButton:FindFirstChild("TextLabel")
                            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                            TweenService:Create(optionButton, tweenInfo, {BackgroundTransparency = 1}):Play()
                            if optionLabel then
                                TweenService:Create(optionLabel, tweenInfo, {TextTransparency = 1}):Play()
                            end
                        end
                    end
                    TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.fromOffset(340, 0)}):Play()
                    task.delay(0.3, function()
                        if not isOpen then
                            dropdownList.Visible = false
                        end
                    end)
                end
            end

            local function toggleDropdown()
                isOpen = not isOpen
                if isOpen then
                    arrowIcon.Image = "rbxassetid://10709768939"
                    updateListSize(true)
                else
                    arrowIcon.Image = "rbxassetid://10709767827"
                    updateListSize(false)
                end
            end

            dropdownButton.MouseButton1Click:Connect(toggleDropdown)

            for _, option in ipairs(options) do
                local optionButton = Instance.new("TextButton")
                local uICornerOption = Instance.new("UICorner")
                local optionLabel = Instance.new("TextLabel")

                optionButton.BackgroundColor3 = theme.DropdownOptionBackground
                optionButton.BackgroundTransparency = 1
                optionButton.Size = UDim2.fromOffset(340, optionHeight)
                optionButton.Text = ""
                optionButton.AutoButtonColor = false
                optionButton.Parent = dropdownList

                uICornerOption.CornerRadius = UDim.new(0, 4)
                uICornerOption.Parent = optionButton

                optionLabel.Font = Enum.Font.Gotham
                optionLabel.Text = option
                optionLabel.TextColor3 = theme.ElementText
                optionLabel.TextSize = 14
                optionLabel.TextTransparency = 1
                optionLabel.TextXAlignment = Enum.TextXAlignment.Left
                optionLabel.BackgroundTransparency = 1
                optionLabel.Position = UDim2.fromOffset(10, 0)
                optionLabel.Size = UDim2.fromOffset(320, optionHeight)
                optionLabel.Parent = optionButton

                optionButton.MouseButton1Click:Connect(function()
                    selectedLabel.Text = option
                    selectedLabel.TextColor3 = Color3.fromRGB(0, 120, 255)
                    callback(option)
                    toggleDropdown()
                end)
            end

            dropdown.Parent = dropdownHolder

            local function updateDropdownHolderSize()
                dropdownHolder.Size = UDim2.fromOffset(340, 35 + (isOpen and listHeight or 0))
                updateCanvasSize()
            end

            dropdownList:GetPropertyChangedSignal("Size"):Connect(updateDropdownHolderSize)
        end

        return ElementHandler
    end

    tabContainer.ChildAdded:Connect(function()
        local firstContainer = contentFrame:FindFirstChild("container")
        if firstContainer then
            firstContainer.Visible = true
            local firstButton = tabContainer:FindFirstChildWhichIsA("TextButton")
            if firstButton then
                firstButton.BackgroundColor3 = theme.TabButtonActive
                firstButton.BackgroundTransparency = transparency and 0.2 or 0
                firstButton:FindFirstChild("icon").ImageColor3 = theme.TabIconActive
                firstButton:FindFirstChild("textLabel").TextTransparency = 0
                firstButton:FindFirstChild("textLabel").TextColor3 = theme.TabTextActive
            end
        end
    end)

    spawn(function()
        if table.StartupSound and table.StartupSound.Toggle and table.StartupSound.SoundID then
            local sound = Instance.new("Sound")
            sound.SoundId = table.StartupSound.SoundID
            sound.Volume = 1.5
            sound.TimePosition = table.StartupSound.TimePosition or 0
            sound.Parent = game.CoreGui
            sound:Play()
            sound.Stopped:Wait()
            sound:Destroy()
        end
    end)

    return tabHandler
end

return Library
