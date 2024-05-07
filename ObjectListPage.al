page 50102 "Object List"
{
    PageType = List; // Specifies the page type as a list page, displaying multiple records in a tabular format.
    ApplicationArea = All; // Indicates that the page is accessible in all application areas.
    SourceTable = AllObjWithCaption; // Sets the source table for the page to the system table AllObjWithCaption.
    UsageCategory = Administration; // Categorizes the page under Administration for easier navigation.

    layout
    {
        area(content) // Main content area of the page.
        {
            repeater(Group) // Repeater control to display multiple records.
            {
                field("Object Type"; Rec."Object Type") // Displays the object type.
                {
                    ApplicationArea = All; // Indicates that the field is accessible in all application areas.
                }
                field("Object ID"; Rec."Object ID") // Displays the object ID.
                {
                    ApplicationArea = All;
                }
                field("Object Name"; Rec."Object Caption") // Displays the object caption.
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing) // Action area for processing actions.
        {
            action("Show Only Tables")
            {
                ApplicationArea = All; // Indicates that the action is accessible in all application areas.
                trigger OnAction() // Trigger to execute when the action is invoked.
                begin
                    SetTableFilter(); // Calls the procedure to filter for tables.
                end;
            }

            action("Show Only Pages")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    SetPageFilter(); // Calls the procedure to filter for pages.
                end;
            }

            action("Show Only Table Extensions")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    SetTableExtensionFilter(); // Calls the procedure to filter for table extensions.
                end;
            }

            action("Show Only Page Extensions")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    SetPageExtensionFilter(); // Calls the procedure to filter for page extensions.
                end;
            }

            action("Show All")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ClearAllFilters(); // Calls the procedure to clear all filters.
                end;
            }
        }
    }

    procedure SetTableFilter()
    begin
        Rec.SetRange(Rec."Object Type", Rec."Object Type"::Table); // Sets a filter to display only table objects.
    end;

    procedure SetPageFilter()
    begin
        Rec.SetRange(Rec."Object Type", Rec."Object Type"::Page); // Sets a filter to display only page objects.
    end;

    procedure SetTableExtensionFilter()
    begin
        Rec.SetRange(Rec."Object Type", Rec."Object Type"::TableExtension); // Sets a filter to display only table extension objects.
    end;

    procedure SetPageExtensionFilter()
    begin
        Rec.SetRange(Rec."Object Type", Rec."Object Type"::PageExtension); // Sets a filter to display only page extension objects.
    end;

    procedure ClearAllFilters()
    begin
        Rec.SetRange("Object Type"); // Clears any filters on the "Object Type" field.
    end;
}
