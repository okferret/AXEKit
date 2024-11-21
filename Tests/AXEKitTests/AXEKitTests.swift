import Testing
@testable import AXEKit

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let ics_text: String = """
        BEGIN:VCALENDAR
        VERSION:2.0
        PRODID:-//Your Company//NONSGML v1.0//EN
        CALSCALE:GREGORIAN

        BEGIN:VEVENT
        SUMMARY:Team Meeting
        DTSTART:20241115T090000Z
        DTEND:20241115T100000Z
        LOCATION:Room 101
        DESCRIPTION:Discuss project progress and next steps.
        UID:12345@example.com
        STATUS:CONFIRMED
        SEQUENCE:0
        ATTENDEE;CN=John Doe;RSVP=TRUE:mailto:john.doe@example.com
        ATTENDEE;CN=Jane Smith;RSVP=TRUE:mailto:jane.smith@example.com

        BEGIN:VALARM
        TRIGGER:-PT15M
        DESCRIPTION:Reminder for Team Meeting
        ACTION:DISPLAY
        END:VALARM

        RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR;UNTIL=20241130T235959Z
        END:VEVENT

        BEGIN:VEVENT
        SUMMARY:Project Deadline
        DTSTART:20241120T170000Z
        DTEND:20241120T170000Z
        LOCATION:Online
        DESCRIPTION:Final submission deadline for the project.
        UID:67890@example.com
        STATUS:TENTATIVE
        SEQUENCE:0
        ATTENDEE;CN=John Doe;RSVP=TRUE:mailto:john.doe@example.com

        BEGIN:VALARM
        TRIGGER:-PT1H
        DESCRIPTION:Reminder for Project Deadline
        ACTION:DISPLAY
        END:VALARM
        END:VEVENT

        BEGIN:VTODO
        SUMMARY:Buy groceries
        DUE:20241116T170000Z
        STATUS:NEEDS-ACTION
        PRIORITY:5
        DESCRIPTION:Pick up fruits, vegetables, and snacks from the store.
        UID:abcdef12345@example.com
        END:VTODO

        BEGIN:VJOURNAL
        SUMMARY:Daily Reflection
        DTSTART:20241115T220000Z
        DESCRIPTION:Reflect on the day's achievements and challenges.
        UID:98765@example.com
        END:VJOURNAL

        BEGIN:VTIMEZONE
        TZID:America/New_York
        BEGIN:STANDARD
        DTSTART:20241102T020000
        RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU
        TZOFFSETFROM:-0400
        TZOFFSETTO:-0500
        TZNAME:EST
        END:STANDARD
        END:VTIMEZONE

        END:VCALENDAR

        """
    
    let obj: VCalendar = try .parse(ics_text)
    // print(obj)

    let element: BusyType = .init(newValue: .BUSYUNAVAILABLE)
    
    print(element)
}
