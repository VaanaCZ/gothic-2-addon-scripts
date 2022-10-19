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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Oyez, habitants de Khorinis ! Sur ordre de l'honorable seigneur Hagen, le d�cret suivant a �t� promulgu�.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //En raison de la situation, pour votre propre protection, il est conseill� d'�viter les for�ts et les zones sauvages aux alentours de la cit�.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //De plus, tout contact avec les paysans rebelles dans les r�gions avoisinantes est interdit.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //A partir d'aujourd'hui, le seigneur Andr� prend le commandement de notre milice.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //Tous les citoyens de la ville qui savent se battre sont invit�s � se joindre � la milice royale.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Les mesures de s�curit� pour la protection du haut quartier seront renforc�es.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Les gardes � la porte ont re�u l'ordre d'appliquer la loi � la lettre pour emp�cher toute entr�e ill�gale.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //La loi martiale a �t� d�clar�e dans toutes les villes et r�gions du royaume.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //Tous les juges civils doivent confier leurs t�ches aux paladins royaux et ce, imm�diatement.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //L'honorable seigneur Andr� a re�u pour instruction de condamner encore plus s�v�rement les crimes ou les actes de r�sistance contre la garde royale.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Tout habitant de Khorinis coupable d'un crime doit le signaler sur l'instant au seigneur Andr�.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //En raison d'une attaque orque imminente, chaque citoyen doit se tenir pr�t.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //Tout le monde doit s'entra�ner au combat et s'armer comme il convient.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //Le forgeron mercenaire Bennet, qui a tra�treusement assassin� le paladin Lothar, a �t� condamn� au nom d'Innos.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Il sera pendu jusqu'� ce que mort s'ensuive. L'ex�cution aura lieu dans quelques jours.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Le forgeron Bennet a �t� lav� de toute accusation car la preuve de son innocence a �t� faite par l'un des conseillers du seigneur Hagen.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Il ne faut pas pr�ter foi aux rumeurs selon lesquelles des dragons seraient apparus dans la Vall�e des mines.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Ces rumeurs sont r�pandues par l'ennemi pour semer la peur et la terreur parmi les braves gens de Myrtana.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Pour tordre le cou � ces affirmations ridicules, une troupe de courageux paladins est partie vers la Vall�e des mines sous le commandement d'un individu connaissant bien la r�gion.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Les dragons qui mena�aient nos terres ont �t� vaincus par des braves sous le commandement du seigneur Hagen.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Bient�t, le roi Rhobar aura lib�r� nos terres des orques et notre royaume prosp�rera de nouveau.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //A partir de maintenant, le seigneur Andr� prend le commandement de la ville de Khorinis.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Le seigneur Hagen a annonc� qu'il se rendrait personnellement dans la Vall�e des mines pour s'assurer que le minerai magique sera charg� sur son navire.
		};
	};
	AI_UseItemToState	(self,	Fakescroll,	-1);
};


/* 

			AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //H�rt B�rger von Khorinis den Beschlu� des ehrenwerten Lord Hagen!
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //An alle B�rger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //H�rt ihr Bewohner von Khorinis und vernehmt das k�nigliche Dekret zur Aufrechterhaltung der �ffentlichen Ordnung.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt. 





Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
H�rt ihr B�ger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen f�r das K�nigreich!

Kapitel 3 Bennet ist im Knast
H�rt ihr B�rger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimt�ckisch ermordert hat, ist im Namen Innos verurteilt worden. 
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
H�rt ihr B�rger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde. 
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir. 
 
Kapitel 5 Start Drachen sind tot
H�rt B�rger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen M�nnern unter dem Befehl von Lord Hagen besiegt.   
Bald wird auch K�nig Rohbar das Land von den Orks befreien und das K�nigreich wird in neuem Glanz aufbl�hen!


Kapitel 5 Kurz vor Schlu� (Spieler war in der Biblothek) 
Der ehrenwerte Lord Hagen hat verk�ndet nun selbst ins Minental zu ziehen um daf�r zu sorgen das sein Schiff mit dem Erz beladen werden kann.  

*/
