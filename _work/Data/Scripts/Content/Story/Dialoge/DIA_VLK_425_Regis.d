///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Hey, du bist neu in der Stadt, was?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Ja, und was ist mit dir?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //Ich komme vom Festland und jetzt hänge hier rum. Ich hab bald kein Gold mehr und kann wohl nur noch zur Miliz gehen.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Aber das will ich nicht. Ich lasse mich doch nicht für den König von den Orks abschlachten.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"Was kannst du mir über die Miliz erzählen?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Was kannst du mir über die Miliz erzählen?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Einer der Paladine hat das Kommando übernommen. Ein gewisser Lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Er vesucht, die halbe Stadt zu mobilisieren, für den Fall, daß die Orks angreifen.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Aber du mußt Bürger der Stadt sein, um aufgenommen zu werden.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Trainieren kann man zwar auch so, soviel ich weiß, aber man wird nicht offiziell aufgenommen.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"Was kannst du mir noch über Lord Andre erzählen?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Was kannst du mir noch über Lord Andre erzählen?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Er hat auch das Amt des Richters übernommen.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Wenn du hier in der Stadt Ärger machst, mußt du dich vor ihm verantworten.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Ich hatte mal 'ne Schlägerei mit einem der Bürger.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //Der ist direkt zu Lord Andre gerannt und hat alles gepetzt.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Der Spaß hat mich 50 Goldstücke gekostet.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Ich kann froh sein, daß es nachts war... Sonst hätten es noch andere mitgekriegt.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Je mehr Leute sich in diesem Kaff hier über dich beschweren, desto höher wird deine Strafe.
};

// ****************************************************
// 					Prügelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Mit wem hast du dich geprügelt?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //Mit wem hast du dich geprügelt?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Mit einem Typen namens Valentino. Er hängt oft in der Kneipe beim Tempel rum.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //Ich bin ja normalerweise ein friedliebender Mensch. Aber DER Typ brauchte einfach was auf's Maul...
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"Ich habe Valentino getroffen...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Ich habe Valentino getroffen...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //Und?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Ich habe ihm eine ordentliche Abreibung verpasst...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(lacht) Das hat er verdient...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Hier - diesen Ring hab ich bei ihm gefunden, als wir unsere kleine Auseinandersetzung beendet hatten.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(schmunzelt) Du kannst ihn ja an den Nächsten weitergeben, der ihm eine Tracht Prügel verabreicht...
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ist hier irgendwas aufregendes passiert?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Ist hier irgendwas Aufregendes passiert?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Kann man wohl sagen.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Bosper, den Bogner, haben sie bestohlen. Ganz schön dreist, kann ich dir sagen!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Der Kerl ist am helllichten Tag in den Laden reinspaziert und hat sich einen Bogen geschnappt.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //Und Bosper hinter ihm her. 'Bleib stehen du Lump', hat er gebrüllt! Aber der Dieb war zu schnell.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Ein ehrlicher Finder hat doch tatsächlich Bosper seinen geklauten Bogen wiedergebracht.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //Ist schon komisch, da denkt man, jeder arbeitet nur in die eigene Tasche, und dann kommt da ein Mann vorbei und bringt einfach diesen Bogen zurück.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Ach nee, alles ruhig. Schätze, wenn die Orks kommen, werden wir's hören ...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Sie haben doch tatsächlich herausgefunden, dass der Söldner unschuldig ist und mussten ihn laufen lassen.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen ist bestimmt außer sich vor Wut.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Die ganze Stadt spricht schon davon. Erinnerst du dich an Lothar, den Paladin?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Kann sein.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Jedenfalls ist er tot. Auf offener Straße ermordet. Natürlich gibt man den Söldnern die Schuld.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Ich suche eine Mannschaft für eine Schiffsreise.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Ich suche eine Mannschaft für eine Schiffsreise.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //Da kann ich dir nicht weiterhelfen. An deiner Stelle würde ich mich mal im Hafen umsehen, vielleicht auch in der Kneipe.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Wenn es hier noch ein paar Seeleute gibt, dann wirst du sie wahrscheinlich dort finden.

};


