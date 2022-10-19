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

	AI_Output (self ,self,"DIA_Herold_Announce_04_00"); //��������, ������ ��������! �� ������� �������� �������������� ����� ������, ������� �������� � ���� ��������� ������.
	
	if (Kapitel <= 2)
	{
		randy = Hlp_Random (5);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_01"); //�������� ����� ��������, ���� � ������� ����� ������ ������� �������� ���� ����� ����������� �� ������������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_02"); //����� ����, ����� �������� � ����������� ����������� � ���������� ������ ��������� ���������.
		}
		else if (randy == 1)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_03"); //� ����� ������� ���� ����� ����������� ����������������� ����� ����������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_04"); //��� �������� ����� ������, ������� ������� ������, ������� �������� � ����������� ���������.
		}
		else if (randy == 2)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_05"); //���� ������������ �� ������ �������� �������� ����� ��� �������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_06"); //������ � ����� ��������� ��������� ����� ����� ���������� �������, ����� ������������� ������������������� ������ � ��������.
		}
		else if (randy == 3)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_07"); //�� ���� ������� � ���������� ����������� ����������� ������� ���������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_08"); //��� ����������� ����� ������ ������� ���� ����������� � �������� �� ����������� ���������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_09"); //������������� ����� ����� ��������� ������ ����� ������������ ��� ��� ������������� ����������� ������ ����� �������� �������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_10"); //��� ������ ��������, �������� � ������������, ������ ���������� ������� � ����� �����.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_11"); //�������� ��������� ��������� �� ����� �����, ��� ������ ������ ������ ��������������� ������� �������������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_12"); //��� ������ ���������� ���������� � �������� ������ ������� � ������� ������� �����������.
		};
	}
	else if (Kapitel == 3)
	{
		IF (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_13"); //������-������� ������, ��������� ������� �������� ������, ����������� ��������� �� ����� ������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_14"); //�� ���������� � ������ ����� ���������. �������� ����� �������� � ���������� � ��������� ���.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_15"); //� ������� ������� ���� ����� ��� ��������� ���������� ��� ������������, ������� ���� �������� ���������� ����� ������.
		};	
	}
	else if (Kapitel == 4)
	{
			AI_Output (self ,self,"DIA_Herold_Announce_04_16"); //����� � ��������� �������� � ������ �������� �������� �������� �������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_17"); //��� ����� ���������������� ������ � ����� ������� ����� � ���� � ����� ������������ ������� �������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_18"); //����� �������� ��� ������� �����, � ������ �������� ��� ��������� ����� ������ ��������� ��� ������������� ��������, ������ ��������� � ���� ����������.
	}
	else	//Kapitel 5
	{
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_19"); //�������, ���������� ����������� ����� �����, ���� ���������� ������������ ������ ��� ������������� ����� ������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_20"); //����� ������ ����� ��������� ���� ����� �� �����, � ����������� ����� ������ �������� � �������������.
		}
		else
		{
			AI_Output (self ,self,"DIA_Herold_Announce_04_21"); //���� ����� ����������� ��������� ����������� ������ ��������. �� �������� � ��� ��������� ����������.
			AI_Output (self ,self,"DIA_Herold_Announce_04_22"); //���� ����� �������, ��� ����� ������������ � ������ ��������, ����� ���������� �������� ������� ���������� �����.
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
