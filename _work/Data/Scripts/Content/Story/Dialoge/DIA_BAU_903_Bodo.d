// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bodo_EXIT   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 999;
	condition   = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo (PERM) 
// ************************************************************
INSTANCE DIA_Bodo_Hallo   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 1;
	condition   = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent   = TRUE;
	description = "Wie steht's?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //Wie steht's?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Die Miliz hat uns lange genug schikaniert. Jetzt, wo die Söldner auf unserer Seite sind, werden sie sich nicht mehr trauen, hier einfach so aufzukreuzen.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Der König glaubt wohl, er kann sich alles erlauben. Aber jetzt ist Schluss damit.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Gut. Wenn du ein paar Milizen siehst, brat ihnen von mir auch eins über, ja?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Gut. Innos sei mit dir.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Truppen des Königs sind auf dem Hof nicht gerade willkommen.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //Viele der Leute hier werden wohl trotzdem mit dir reden, aber beliebt machst du dich hier bestimmt nicht.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Bodo_Bauernaufstand   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 2;
	condition   = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent   = FALSE;
	description = "In der Stadt ist von Bauernaufstand die Rede!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //In der Stadt ist von Bauernaufstand die Rede!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //Unsinn. Wir machen nichts, außer das, wofür wir hart gearbeitet haben, zu verteidigen.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //Es ist doch so, der Krieg wird auf dem Rücken der Bauern ausgetragen. Aber Onar ist nicht mehr bereit zuzusehen, wie der König uns ausblutet.
};

// ************************************************************
// 			  				   Bett
// ************************************************************
INSTANCE DIA_Bodo_Bett   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 3;
	condition   = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent   = FALSE;
	description = "Kann ich mich hier irgendwo ausruhen?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Kann ich mich hier irgendwo ausruhen?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Wenn du einen Platz zum Schlafen suchst, geh in die Scheune. Aber leg dich nicht aus Versehen in das Bett eines Söldners.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar sorgt zwar dafür, dass sie uns Bauern in Ruhe lassen, aber mit Fremden, die nicht zum Hof gehören, machen die Söldner, was sie wollen.
};

// ************************************************************
// 			  				   Cipher
// ************************************************************
INSTANCE DIA_Bodo_Cipher   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 4;
	condition   = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent   = FALSE;
	description = "Cipher hat mir erzählt, ihm wäre ein Paket Sumpfkraut gestohlen worden...";
};
FUNC INT DIA_Bodo_Cipher_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	|| (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_Cipher_Info()
{
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher hat mir erzählt, ihm wäre ein Paket Sumpfkraut gestohlen worden...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //Und?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Er denkt, du hättest es genommen.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Ach, DESwegen glotzt der Typ mich immer so dämlich an.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Ich bin in letzter Zeit immer extra freundlich zu ihm, weil ich denke, der Typ ist echt mies drauf.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Aber da war nichts zu machen. Ich mache ein freundliches Gesicht und er starrt mich an, als ob er mich umbringen wolle.
};

// ************************************************************
// 			  				  WeedOrElse
// ************************************************************
INSTANCE DIA_Bodo_WeedOrElse   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 5;
	condition   = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent   = FALSE;
	description = "Her mit dem Kraut, oder du lernst mich kennen!";
};
FUNC INT DIA_Bodo_WeedOrElse_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedOrElse_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Her mit dem Kraut, oder du lernst mich kennen!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Hör zu, alles was ich habe, ist dieser eine Stängel Kraut. Nimm ihn und lass mich in Ruhe.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Du weißt ja, dass Onars Söldner auf uns aufpassen, nicht wahr?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Also mach ja keine Dummheiten!
	};
};

// ************************************************************
// 			  				  WeedPERM
// ************************************************************
INSTANCE DIA_Bodo_WeedPERM   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 6;
	condition   = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent   = TRUE;
	description = "Ich glaub dir kein Wort, her mit dem Sumpfkraut!";
};
FUNC INT DIA_Bodo_WeedPERM_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedPERM_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Ich glaub dir kein Wort, her mit dem Sumpfkraut!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Ich hab's nicht. Ehrlich.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bodo_PICKPOCKET (C_INFO)
{
	npc			= BAU_903_Bodo;
	nr			= 900;
	condition	= DIA_Bodo_PICKPOCKET_Condition;
	information	= DIA_Bodo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bodo_PICKPOCKET_Condition()
{
	C_Beklauen (30, 60);
};
 
FUNC VOID DIA_Bodo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bodo_PICKPOCKET);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_BACK 		,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};
	
func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};













