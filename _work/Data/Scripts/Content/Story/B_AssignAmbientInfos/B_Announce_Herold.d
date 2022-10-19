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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //Sly�te, ob�an� Khorinidu! Podle p��m�ho rozkazu ctihodn�ho lorda Hagena vstupuje v platnost n�sleduj�c� na��zen�.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //Z bezpe�nostn�ch d�vod� se vstup do les� a divo�iny kolem m�sta d�razn� nedoporu�uje.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //Nav�c je p��sn� zak�z�n jak�koli kontakt se vzbou�en�mi roln�ky v p�ilehl�ch oblastech.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //T�mto okam�ikem se lord Andre st�v� vrchn�m velitelem na�� domobrany.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //V�ichni ob�an� na�eho m�sta, kte�� dok�ou udr�et zbra�, jsou nal�hav� ��d�ni, aby pos�lili �ady kr�lovsk� domobrany.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //Bezpe�nostn� opat�en� zaji��uj�c� ochranu horn� ��sti m�sta budou je�t� v�ce zp��sn�na.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //Str�c�m br�ny se nakazuje, aby se p��sn� dr�eli rozkaz� a zabr�nili tak vstupu kohokoli nepovolan�ho.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //Ve v�ech m�stech a oblastech cel� ��e t�mto okam�ikem vstupuje v platnost stann� pr�vo.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //V�ichni civiln� soudci p�edaj� s okam�itou platnost� sv� ��ady kr�lovsk�m paladin�m.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //Ctihodn� lord Andre je pov��en co nejp��sn�j��m potrest�n�m ve�ker� nez�konn� �innosti �i pokus� o odpor v��i kr�lovsk� gard�.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //Ka�d� obyvatel Khorinidu, kter� se provin� nez�konnou �innost�, se bude okam�it� zodpov�dat lordu Andremu.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //Z d�vodu bezprost�edn�ho nebezpe�� �tok� sk�et� jsou v�ichni ob�an� ��d�ni, aby se na tuto hrozbu dostate�n� p�ipravili.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //V�ichni nech� neprodlen� zapo�nou s bojov�m v�cvikem a p�im��en� se ozbroj�.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //�oldn��sk� kov�� Bennet, kter� podle zavra�dil paladina Lothara, byl ve jm�nu Innose uzn�n vinn�m.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //Rozsudek zn� smrt ob�en�m. Poprava se bude konat za n�kolik m�lo dn�.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //Kov�� Bennet byl zpro�t�n ob�aloby, proto�e r�dce lorda Hagena prok�zal jeho nevinu.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //Zv�sti, kter� vypov�daj� o p��tomnosti drak� v Hornick�m �dol� Khorinidu, se nezakl�daj� na pravd�.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //Tyto pov�da�ky byly ���eny nep��telem, aby mezi odv�n�m lidem Myrtany vyvolaly paniku.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //Abychom tyto sm�n� zv�sti vyvr�tili, byla do Hornick�ho �dol� vysl�na jednotka state�n�ch paladin� pod veden�m jednoho z nich, jen� se v t� oblasti dokonale vyzn�.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //Draci, kte�� ohro�ovali na�i zem, byli pora�eni state�n�mi mu�i pod veden�m lorda Hagena.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //Kr�l Rhobar u� brzy zbav� na�i zemi sk�et� a kr�lovstv� znovu dos�hne d��v�j�� sl�vy a rozkv�tu.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //Lord Andre p�evezme s okam�itou platnost� nejvy��� velen� nad m�stem Khorinis.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //Lord Hagen prohl�sil, �e se osobn� z��astn� v�pravy do Hornick�ho �dol�, aby zajistil, �e jeho lo� odtamtud odpluje jen a pouze s pln�m podpalub�m magick� rudy.
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
