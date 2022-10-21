// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Warum bist du hier erschienen?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Diener des B�sen. Warum bist du hier erschienen? Bist du nur gekommen, um Angst und Schrecken zu verbreiten?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Der h�here Sinn unserer Zusammenkunft in dieser Welt, kleiner Mensch, wird dir verborgen bleiben.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Wie bekomme ich die anderen Drachen zum Reden?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Was muss ich tun um euch wieder zu verbannen?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Was in Innos' Namen muss ich tun, um euch wieder aus der Welt der Menschen zu verbannen?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(lacht) Bevor du handeln kannst, musst du erst den Sinn unserer Zusammenkunft verstehen.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Doch wird dir niemand aus freien St�cken davon berichten.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Allein das Auge k�nnte unsere Zungen l�sen und dir unsere wahren Ziele offenbaren.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //Allerdings wird dir das nichts n�tzen, wenn du tot bist.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Man hat uns schon davon unterrichtet, dass du den Weg des Drachenj�gers gew�hlt hast.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Also haben wir unsere Nachkommenschaft in eure Welt entsandt, um den Bestand unserer Ahnenreihe zu sichern.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Du hast schon verloren, kleiner Mensch.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Einer der Drachen faselte irgendwas von Nachkommenschaft und Bestand seiner Ahnenreihe. Ich f�rchte sie haben ihre Brut �ber die ganze zivilisierte Welt verteilt. "); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //Das Auge hat dir den Zugang gew�hrt. Doch ob du meiner w�rdig bist, wird allein der Zweikampf entscheiden.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Wie bringe ich die anderen Drachen zum Reden?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Allein mein Herz k�nnte dir helfen, die Macht des Auges zu erneuern.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Aber es wird dir nicht gelingen, mir das Herz zu entrei�en.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "Wer hat euch hierher entsandt?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //In welchem Auftrag handelt ihr? Wer hat euch hierher entsandt?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //�ber unser aller Heil und Wohl steht der Meister mit seinem Wort der Macht. Bald wird sich ihm niemand mehr entziehen k�nnen.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Aus dem Reich der Toten langt sein Arm schon sehr weit. Die Geister der Nacht versammeln sich in freudiger Erwartung seiner Ankunft.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Er wird �ber euch Menschen kommen und die Welt beherrschen.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //In seinem Schatten sind wir nicht mehr als Beiwerk seiner sch�pferischen Kraft.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Der Meister wird kommen, eure geplagten Leiber wieder aus der Asche zu erheben, um mit ihnen das Geschick der Erde neu zu richten.

	B_LogEntry (TOPIC_DRACHENJAGD,"Die Drachen sind nicht ihr eigener Herr. Sie dienen einem Meister, �ber den sie sich nur sehr wage �ussern. Der Meister wird kommen die Welt zu vernichten und so weiter. Das �bliche eben."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "Wie kann ich euren Meister bezwingen?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Wie kann ich euren Meister bezwingen?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Er ist allm�chtig und nahezu unbesiegbar. Solltest du so t�richt sein, ihm trotzdem zu begegnen, wirst du einen langsamen und qualvollen Tod sterben.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //So etwas h�re ich nicht zum ersten Mal. Nahezu unbesiegbar hei�t nicht, dass ich ihn nicht t�ten kann.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Also, raus mit der Sprache: Was muss ich tun?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Um meinem Meister die Stirn bieten zu k�nnen, ben�tigst du die Dinge, die er niemals im Stande w�re zu erlangen.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //Und was ist das?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Du musst die h�chste R�stung deiner irdischen Gemeinschaft erlangen und sie auf deiner Haut tragen.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Du brauchst ein Schwert, welches von deinem Gott gesegnet wurde.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Du brauchst eine Rune, die nur f�r dich angefertigt wurde.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Du brauchst eine Waffe, die nur f�r dich angefertigt wurde.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Aber die wohl schwierigste aller Bedingungen ist, dass du f�nf Gef�hrten f�r dich gewinnen musst, die dir in den Tod folgen w�rden.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Erst dann und nur dann kannst du es wagen, dem Meister zu begegnen.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "Wie kann ich euren Meister finden?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Wie kann ich euren Meister finden?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Er hat seinen Hort im festem Fels der heiligen Hallen von Irdorath errichtet und wartet dort auf die Erf�llung seines Schicksals.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Auf dass er dieser Welt die Ordnung zur�ckgebe, die sie verdient, verweilt er dort in tiefer Meditation und ...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Verschone mich mit den Einzelheiten. Sag mir lieber, wo ich diese heiligen Hallen von Irdorath finde.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha, ha, ha. Du entt�uschst mich, kleiner Mann. Hast du doch allen Gefahren getrotzt, fast alle von uns bezwungen und scheiterst nun an deinem Unverm�gen, das obere Wissen anzuwenden.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Wenn dir Irdorath kein Begriff ist, dann solltest du besser zu deinen Magiern gehen und sie bitten, dich um ihre weltlichen Belange k�mmern zu d�rfen.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Denn ganz offensichtlich bist du noch nicht bereit f�r die hohe B�rde ihres oberen Wissens.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Der Meister der Drachen soll seinen Hort im festem Fels der heiligen Hallen von Irdorath errichtet haben. Mmh. Das kommt mir bekannt vor. Wo habe ich das schon einmal gelesen?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













