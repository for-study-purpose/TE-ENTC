class Player {
    String name;
    int age;
    String game;
    
    Player(String name, int age) {
        this.name = name;
        this.age = age;
    }

    Player(String name, int age, String game) {
        this.name = name;
        this.age = age;
        this.game = game;
    }

    public void displayPlayerDetails() {
        System.out.println("Name : " + name);
        System.out.println("Age : " + age);

        if (game != null) {
            System.out.println("Game : " + game);
        }

        System.out.println();
    }
}

class CricketPlayer extends Player {
    static String game = "Cricket";

    CricketPlayer(String name, int age) {
        super(name, age, game);
    }
}

class FootballPlayer extends Player {
    static String game = "Football";

    FootballPlayer(String name, int age) {
        super(name, age, game);
    }
}

class HockeyPlayer extends Player {
    static String game = "Hockey";

    HockeyPlayer(String name, int age) {
        super(name, age, game);
    }
}

public class Experiment6 {
    public static void main(String[] args) {

        System.out.println();

        Player p = new Player("Dnyanesh", 20);

        Player pC = new CricketPlayer("Suresh", 21);

        Player pF = new FootballPlayer("Aryan", 23);

        Player pH = new HockeyPlayer("Vineet", 21);

        p.displayPlayerDetails();
        pC.displayPlayerDetails();
        pF.displayPlayerDetails();
        pH.displayPlayerDetails();
    }
}
