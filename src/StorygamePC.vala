using Gtk;
using Gdk;

static const string words[] =
{
    "DRAGON","COMPUTER","NOTE","CALCULATE","CASTLE","HARP","WORLD",
    "SEA","BOOK","WIZARD","TREE","PLANE","JUNGLE","TEMPLE","CACKE",
    "CHICKEN","DEVICE","BOTTLE","DOG","BEER","MOON","SPACESHIP","FIREWORK",
    "VOLCANO","STORM","POETRY","FLOWER","PYTHON","TIME","ICE","THUNDER",
    "FIRE","WITCH","HEL","BUILDING","BRIDGE","CHAIR","BIRD","ROCK","SUN",
    "STARS","ALIEN","UFO","WAND","KEY","LOCK","HOOK","HORSE","GOAT","RAIN",
    "ARROW","EYE","WATCH","JUMP","FISH","MASK","PENTAGRAM","SWORD","TOWN",
    "BABY","TURTLE","HUT","SKELETON","SHADOWS","MONSTER","SEARCH","CHEST",
    "SLEEP","GOLD","WRITER","LIGHT","DARKNESS","ANGLE","THOR","DEVIL","FOOD",
    "POISON","LABYRINTH","THIEF","CROWN","DWARF","WOLF","MARKET","PRINCESS",
    "CHURCH","DEAD","FISHER","SERPENT","KING","RAINBOW","SNOW","ARMOR",
    "FAIRY","BIKE","LOKI","BANDAGE","BLOOD","QUEEN","ISLAND","GAME",
    "OXYGEN","PLANT","SOAP","HERO","OIL","PAINTING","MUSIC"
};
const int32 num_words = words.length;

static const string icon_xpm[] = {
"16 16 107 2",
"  	c #D7AF8C",
". 	c #000000",
"+ 	c #DFB794",
"@ 	c #DCB491",
"# 	c #D8B190",
"$ 	c #DCB594",
"% 	c #D7B08F",
"& 	c #D6AF8E",
"* 	c #DBB390",
"= 	c #DAB392",
"- 	c #DBB493",
"; 	c #DEB693",
"> 	c #DDB592",
", 	c #DAB28F",
"' 	c #D9B291",
") 	c #DDB695",
"! 	c #D9B595",
"~ 	c #D8B494",
"{ 	c #D8B492",
"] 	c #D7B393",
"^ 	c #DAB696",
"/ 	c #DAB799",
"( 	c #D7B496",
"_ 	c #D9B698",
": 	c #DCBA9E",
"< 	c #D9B18E",
"[ 	c #D9B593",
"} 	c #D6B292",
"| 	c #D8B798",
"1 	c #DAB79B",
"2 	c #DBB99D",
"3 	c #DDBB9F",
"4 	c #DCBDA1",
"5 	c #D7B295",
"6 	c #D8B69A",
"7 	c #DAB89C",
"8 	c #DBBC9F",
"9 	c #DFBDA2",
"0 	c #DFC0A4",
"a 	c #E0C1A5",
"b 	c #DFC1A7",
"c 	c #D2AE8E",
"d 	c #D6B395",
"e 	c #D8B99C",
"f 	c #E2C4AA",
"g 	c #E0C4AC",
"h 	c #D6B498",
"i 	c #DDBEA2",
"j 	c #DDC2A7",
"k 	c #E0C5AA",
"l 	c #E2C6AE",
"m 	c #E6BF9E",
"n 	c #E4BD9C",
"o 	c #E1BA99",
"p 	c #DCB896",
"q 	c #DBB797",
"r 	c #DABB9E",
"s 	c #DCBEA4",
"t 	c #DFC5AC",
"u 	c #E2C8AF",
"v 	c #E2CAB2",
"w 	c #E4CAB3",
"x 	c #E4CBB5",
"y 	c #E0B998",
"z 	c #DDB89B",
"A 	c #E0BD9F",
"B 	c #E5C3A7",
"C 	c #E6C7AB",
"D 	c #DFC4A9",
"E 	c #E4CCB4",
"F 	c #E1C8B4",
"G 	c #E8CAAE",
"H 	c #E4CAB1",
"I 	c #E2CCB7",
"J 	c #DEC8B3",
"K 	c #E2BB9A",
"L 	c #E3BC9B",
"M 	c #E2BE9E",
"N 	c #E3BF9F",
"O 	c #E3C0A2",
"P 	c #E2C1A2",
"Q 	c #E2C0A5",
"R 	c #DEC0A4",
"S 	c #E3C9B0",
"T 	c #E5CDB5",
"U 	c #E5CFB8",
"V 	c #E5CFBA",
"W 	c #E2CDBA",
"X 	c #E0CBB8",
"Y 	c #DEC9B6",
"Z 	c #E1BEA0",
"` 	c #E0BEA2",
" .	c #DBBDA3",
"..	c #DDC5AD",
"+.	c #E1C8B2",
"@.	c #E2D0BC",
"#.	c #E2CFBE",
"$.	c #E4CFBE",
"%.	c #E0CAB5",
"&.	c #E1CCB9",
"*.	c #DAB694",
"=.	c #DBBA9B",
"-.	c #DEBCA0",
";.	c #DEBFA3",
">.	c #DFC9B4",
",.	c #DDC8B5",
"'.	c #DBC8B7",
"  . . + + @ # . . . $ $ . . % & ",
". * @ . . . . = . $ . . - = . # ",
"; > * , ' = $ ) . $ ! ~ ~ ~ ! ! ",
". . . * . - $ $ . { ] ] . . ^ / ",
". * - . $ . . ~ . ] . . ( _ . : ",
"< , - - - [ ] } . ( ( | 1 2 3 4 ",
"= ' # # } } 5 ( . 6 7 8 9 0 a b ",
"$ . . . c . d | . e 4 . . . f g ",
". ' ' . . ] . h . i . j k l . . ",
"m n o p q / 2 r . s j t u v w x ",
"y . . ^ z A B C . D l w E . . F ",
". - ! . . . . G . H . . . I J . ",
"K L M N O P Q R . S T U V W X Y ",
"- ) . . Z ` i  .. ..+.. . @.#.$.",
". . } . . . . b . ... %.&.. . . ",
"$ *.q / =.-.;.. . . +.>.Y ,.'.,."};

enum Target {
    INT32,
    STRING,
    ROOTWIN
}

const TargetEntry[] target_list = {
    { "INTEGER",    0, Target.INT32 },
    { "STRING",     0, Target.STRING },
    { "text/plain", 0, Target.STRING },
    { "application/x-rootwindow-drop", 0, Target.ROOTWIN }
};


public class Leave : Label {

    public Leave (int val) {
        string vall = val.to_string();
        set_text (@"[   $vall   ]");

        Gtk.drag_dest_set (
                this,
                DestDefaults.MOTION
                | DestDefaults.HIGHLIGHT,
                target_list,
                DragAction.COPY
            );

        this.drag_motion.connect(this.on_drag_motion);
        this.drag_drop.connect(this.on_drag_drop);
        this.drag_data_received.connect(this.on_drag_data_received);
    }

    private bool on_drag_motion (Widget widget, DragContext context,
                                 int x, int y, uint time)
    {
        return false;
    }

    private bool on_drag_drop (Widget widget, DragContext context,
                               int x, int y, uint time)
    {

        bool is_valid_drop_site = true;

        if (context.list_targets() != null) {
            var target_type = (Atom) context.list_targets().nth_data (Target.STRING);

            Gtk.drag_get_data (
                    widget,
                    context,
                    target_type,
                    time
                );
        } else {
            // No target offered by source => error
            is_valid_drop_site = false;
        }

        return is_valid_drop_site;
    }

    private void on_drag_data_received (Widget widget, DragContext context,
                                        int x, int y,
                                        SelectionData selection_data,
                                        uint target_type, uint time)
    {
        bool dnd_success = false;
        bool delete_selection_data = false;

        if ((selection_data != null) && (selection_data.get_length() >= 0)) {

            switch (target_type) {
            case Target.STRING:
                dnd_success = true;
                set_text((string) selection_data.get_data());
                break;
            default:
                break;
            }

        }

        if (dnd_success == false) {
       
        }

        Gtk.drag_finish (context, dnd_success, delete_selection_data, time);
    }
}


public class Word : Button {

    public Word (string word) {
        set_name (word);
        set_label (word);

        Gtk.drag_source_set (
                this,
                ModifierType.BUTTON1_MASK,
                target_list,
                DragAction.COPY
            );

        // All possible source signals
        this.drag_data_get.connect(on_drag_data_get);

    }


    private void on_drag_data_get (Widget widget, DragContext context,
                                   SelectionData selection_data,
                                   uint target_type, uint time)
    {
        string string_data = widget.name;

        switch (target_type) {
        case Target.STRING:
            selection_data.set (
                    selection_data.get_target(),
                    8,
                    (uchar [])string_data.to_utf8()
                );
            widget.hide();
            break;
        case Target.ROOTWIN:
            break;
        default:
            assert_not_reached ();
        }
    }
}


static int main (string[] args) {

    Gtk.init (ref args);

    var window = new Gtk.Window (Gtk.WindowType.TOPLEVEL);
    var grid = new Grid();
    grid.orientation = Orientation.HORIZONTAL;
    grid.row_homogeneous = false;
    grid.row_spacing = 5;
    grid.column_spacing = 400;
    int wordsresult[] = {900,900,900,900,900,900,900,900,900,900,900,900,990,900,900,900,900};
    for (int i=0; i < 16; i++)
    {
        bool duplicate = false;
        int32 randd = 0;
        do
        {
            duplicate = false;
            randd = GLib.Random.int_range (0, num_words - 1);
            for(int j = 0; j < i; ++j)
            {
                if (wordsresult[j] == randd)
                {
                    duplicate = true;
                    break;
                }
            }
        } while (duplicate == true);
        wordsresult[i] = randd;
        var word = new Word (words[randd]);
        word.vexpand = true;
        word.name = words[randd];
        grid.attach (word, 0,i,1,1);
    }
    for (int i=0; i < 16; i++){
        var drop_dest = new Leave (i);
        grid.attach(drop_dest, 1,i,1,1);
    }
    window.add (grid);

    window.set_default_size (450, 50);
    //Create a .desktopfile
    try
    {
        var home = Environment.get_variable("HOME");
        var desktopfile = File.new_for_path(@"$home/.local/share/applications/StorygamePC.desktop");
        if (!desktopfile.query_exists()) {
            Posix.system(@"mkdir $home/.local/bin");
            Posix.system(@"mkdir $home/.local/share/applications");
            var desktop_file = FileStream.open(@"$home/.local/share/applications/StorygamePC.desktop", "w");
            print(@"$home/.local/share/applications/StorygamePC.desktop");
            Posix.system("mv $(ps aux|grep StorygamePC$| awk {'print $11'}) $HOME/.local/bin"); //move the game to the local bin folder.
            desktop_file.puts(@"[Desktop Entry]\nName=StoryGamePC\nComment=Ultimate StoryGame for the PC\nExec=\"$home/.local/bin/StorygamePC\"\nTerminal=false\nType=Application\nCategories=Game;\nIcon=Storygame.png");
            Posix.system(@"mkdir $home/.local/share/icons/hicolor/16x16/apps -p");
            Posix.system(@"mkdir $home/.local/share/icons/hicolor/32x32/apps -p");
            Posix.system(@"mkdir $home/.local/share/icons/hicolor/64x64/apps -p");
            Posix.system(@"mkdir $home/.local/share/icons/hicolor/128x128/apps -p");
            Posix.system(@"mkdir $home/.local/share/icons/hicolor/256x256/apps -p");
            Posix.system(@"mkdir $home/.local/share/icons/hicolor/512x512/apps -p");
            Posix.system(@"mkdir $home/.local/share/icons/hicolor/1024x1024/apps -p");
            Posix.system("wget https://raw.githubusercontent.com/PrivacyDragon/StoryGamePC/main/icons/16x16.png https://raw.githubusercontent.com/PrivacyDragon/StoryGamePC/main/icons/32x32.png https://raw.githubusercontent.com/PrivacyDragon/StoryGamePC/main/icons/64x64.png https://raw.githubusercontent.com/PrivacyDragon/StoryGamePC/main/icons/128x128.png https://raw.githubusercontent.com/PrivacyDragon/StoryGamePC/main/icons/256x256.png https://raw.githubusercontent.com/PrivacyDragon/StoryGamePC/main/icons/512x512.png https://raw.githubusercontent.com/PrivacyDragon/StoryGamePC/main/icons/1024x1024.png");
            Posix.system(@"mv 16x16.png $home/.local/share/icons/hicolor/16x16/apps/Storygame.png");
            Posix.system(@"mv 32x32.png $home/.local/share/icons/hicolor/32x32/apps/Storygame.png");
            Posix.system(@"mv 64x64.png $home/.local/share/icons/hicolor/64x64/apps/Storygame.png");
            Posix.system(@"mv 128x128.png $home/.local/share/icons/hicolor/128x128/apps/Storygame.png");
            Posix.system(@"mv 256x256.png $home/.local/share/icons/hicolor/256x256/apps/Storygame.png");
            Posix.system(@"mv 512x512.png $home/.local/share/icons/hicolor/512x512/apps/Storygame.png");
            Posix.system(@"mv 1024x1024.png $home/.local/share/icons/hicolor/1024x1024/apps/Storygame.png");
        }
    } catch (Error e) {
        print(e.message);
    }
    window.icon = new Gdk.Pixbuf.from_xpm_data(icon_xpm);

    window.destroy.connect(Gtk.main_quit);

    window.show_all ();

    Gtk.main ();

    return 0;
}
