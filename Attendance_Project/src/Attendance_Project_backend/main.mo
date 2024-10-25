import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Text "mo:base/Text";

actor {
    // Define a type for student attendance
    type Attendance = {
        name: Text;
        present: Bool;
    };

    // Initialize a buffer to store student attendance
    let attendanceBuffer = Buffer.Buffer<Attendance>(0);

    // Initialize attendance records
    do {
        attendanceBuffer.add({ name = "Adekunle Femi"; present = false });
        attendanceBuffer.add({ name = "Abiola Jemimah"; present = false });
        attendanceBuffer.add({ name = "Fasasi Hassan"; present = false });
        attendanceBuffer.add({ name = "Juliana Abioye"; present = false });
        attendanceBuffer.add({ name = "Mawaleola Olukoya"; present = false });
        attendanceBuffer.add({ name = "Isaac Oreofe"; present = false });
        attendanceBuffer.add({ name = "James Funmilayo"; present = false });
        attendanceBuffer.add({ name = "Sotunde Aderonke"; present = false });
        attendanceBuffer.add({ name = "Adewale Adesola"; present = false });
        attendanceBuffer.add({ name = "Jadesola Akinboboye"; present = false });
    };

    // Function to mark a student present
    public func markPresent(name: Text) {
        let size = attendanceBuffer.size();
        var i = 0;
        while (i < size) {
            let student = attendanceBuffer.get(i);
            if (student.name == name) {
                attendanceBuffer.put(i, { name = student.name; present = true });
            };
            i += 1;
        };
    };

    // Function to mark a student absent
    public func markAbsent(name: Text) {
        let size = attendanceBuffer.size();
        var i = 0;
        while (i < size) {
            let student = attendanceBuffer.get(i);
            if (student.name == name) {
                attendanceBuffer.put(i, { name = student.name; present = false });
            };
            i += 1;
        };
    };

    // Function to print attendance
    public func printAttendance() {
        let size = attendanceBuffer.size();
        var i = 0;
        while (i < size) {
            let student = attendanceBuffer.get(i);
            let status = if (student.present) "Present" else "Absent";
            Debug.print(student.name # " - " # status);
            i += 1;
        };
    };

    // Test the functions
    public func runTest() {
        markPresent("Fasasi Hassan");
        markPresent("Adekunle Femi");
        markPresent("Jadesola Akinboboye");
        printAttendance();
    };
}
