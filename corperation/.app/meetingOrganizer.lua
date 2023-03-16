local meetingName, meetingURL, meetingTimes, meetingOrganizer, hostContactEmail, otherNotes

local function organizerInformation()

    io.write("Meeting Name: ")
    meetingName = io.read()

    io.write("Meeting App Host: ")
    local meetingAppHost = io.read()

    io.write("Meeting URL: ")
    meetingURL = io.read()

    io.write("Meeting Times: ")
    meetingTimes = io.read()

    io.write("Meeting Organizer: ")
    meetingOrganizer = io.read()

    io.write("Host contact email: ")
    hostContactEmail = io.read()

    io.write("Other Notes (optional): ")
    otherNotes = io.read()

end

organizerInformation()

local function writeMeetingDataToFile()

    local file = io.open("openMeetings.txt", "a")

    file:write("\n----- NEW MEETING -----\n")
    file:write("Meeting Name: " .. meetingName .. "\n")
    file:write("Meeting URL: " .. meetingURL .. "\n")
    file:write("Meeting times: " .. meetingTimes .. "\n")
    file:write("Organizer: " .. meetingOrganizer .. "\n")
    file:write("Host contact email: " .. hostContactEmail .. "\n")
    file:write("Other notes: " .. otherNotes .. "\n")
    file:write("\n")

    file:close()
    print("Meeting created! Check the explorer for openMeetings.txt")

end
writeMeetingDataToFile()
