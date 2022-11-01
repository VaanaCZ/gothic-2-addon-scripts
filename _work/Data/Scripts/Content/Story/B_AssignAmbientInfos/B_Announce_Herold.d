// ***************
// B_Announce_Herold 
// ***************

func void B_Announce_Herold ()
{
	var int randy;
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc		(self,	hero);
	};
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	
	CreateInvItem		(self,	Fakescroll);
	AI_UseItemToState	(self,	Fakescroll,	1);

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Oyez, habitants de Khorinis ! Sur ordre de l'honorable seigneur Hagen, le décret suivant a été promulgué.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //En raison de la situation, pour votre propre protection, il est conseillé d'éviter les forêts et les zones sauvages aux alentours de la cité.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //De plus, tout contact avec les paysans rebelles dans les régions avoisinantes est interdit.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //A partir d'aujourd'hui, le seigneur André prend le commandement de notre milice.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Tous les citoyens de la ville qui savent se battre sont invités à se joindre à la milice royale.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Les mesures de sécurité pour la protection du haut quartier seront renforcées.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Les gardes à la porte ont reçu l'ordre d'appliquer la loi à la lettre pour empêcher toute entrée illégale.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //La loi martiale a été déclarée dans toutes les villes et régions du royaume.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Tous les juges civils doivent confier leurs tâches aux paladins royaux et ce, immédiatement.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //L'honorable seigneur André a reçu pour instruction de condamner encore plus sévèrement les crimes ou les actes de résistance contre la garde royale.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Tout habitant de Khorinis coupable d'un crime doit le signaler sur l'instant au seigneur André.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //En raison d'une attaque orque imminente, chaque citoyen doit se tenir prêt.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Tout le monde doit s'entraîner au combat et s'armer comme il convient.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Le forgeron mercenaire Bennet, qui a traîtreusement assassiné le paladin Lothar, a été condamné au nom d'Innos.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Il sera pendu jusqu'à ce que mort s'ensuive. L'exécution aura lieu dans quelques jours.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Le forgeron Bennet a été lavé de toute accusation car la preuve de son innocence a été faite par l'un des conseillers du seigneur Hagen.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Il ne faut pas prêter foi aux rumeurs selon lesquelles des dragons seraient apparus dans la Vallée des mines.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Ces rumeurs sont répandues par l'ennemi pour semer la peur et la terreur parmi les braves gens de Myrtana.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Pour tordre le cou à ces affirmations ridicules, une troupe de courageux paladins est partie vers la Vallée des mines sous le commandement d'un individu connaissant bien la région.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Les dragons qui menaçaient nos terres ont été vaincus par des braves sous le commandement du seigneur Hagen.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Bientôt, le roi Rhobar aura libéré nos terres des orques et notre royaume prospérera de nouveau.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //A partir de maintenant, le seigneur André prend le commandement de la ville de Khorinis.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Le seigneur Hagen a annoncé qu'il se rendrait personnellement dans la Vallée des mines pour s'assurer que le minerai magique sera chargé sur son navire.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Hört Bürger von Khorinis den Beschluß des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle Bürger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Hört ihr Bewohner von Khorinis und vernehmt das königliche Dekret zur Aufrechterhaltung der öffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
Hört ihr Büger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen für das Königreich!

Kapitel 3 Bennet ist im Knast
Hört ihr Bürger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimtückisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
Hört ihr Bürger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
Hört Bürger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen Männern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch König Rohbar das Land von den Orks befreien und das Königreich wird in neuem Glanz aufblühen!


Kapitel 5 Kurz vor Schluß (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verkündet nun selbst ins Minental zu ziehen um dafür zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
