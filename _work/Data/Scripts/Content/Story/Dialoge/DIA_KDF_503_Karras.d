///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Was kann ich für dich tun, Novize?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Was kann ich für dich tun, Bruder?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Die ehrenvollen Streiter Innos verirren sich selten in diese Räume.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Was kann ich für dich tun?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(misstrauisch) Was suchst du hier?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"Ich bin hier, um die Schriften zu lesen.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Ich bin hier, um die Schriften zu lesen.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Verstehe. Wenn du zwischen deinen langwierigen Studien mal Zeit haben solltest, komm zu mir.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Ich hätte da noch eine Sache, für die ich einen verschwiegenen Novizen gebrauchen könnte.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"Du hast eine Aufgabe für mich? ";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Du hast eine Aufgabe für mich?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Ja. Es geht um diesen verrückten Ignaz. Er lebt in Khorinis und forscht an verschiedenen Tränken und Heilmitteln. Aber auch an Zaubersprüchen.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //Und gerade das bereitet mir Sorgen. Ich frage mich, ob seine Magie Innos gefällig ist.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Um das zu prüfen, brauche ich einige seiner Spruchrollen.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Ich will, dass du in die Stadt gehst und mir drei Spruchrollen von ihm besorgst.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Aber zu niemanden ein Wort - klar?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Klar.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Hier sind 150 Goldstücke. Das wird deine Auslagen wohl decken.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Meister Karras schickt mich in die Stadt. Ich soll ihm drei der Spruchrollen besorgen, die Ignaz herstellt und verkauft.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"Ich habe hier die Spruchrollen, die du wolltest.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Ich habe hier die Spruchrollen, die du wolltest.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Gut gemacht, junger Freund.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Jetzt wird es aber Zeit, dass du dich deinen Studien widmest.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Und nimm diese Spruchrolle als Belohnung.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Zeig mir deine Ware.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Zeig mir deine Ware.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"Was genau ist deine Aufgabe?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Was genau ist deine Aufgabe?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Mir obliegt die Ausbildung der Magier in der Kunst der sphärischen Manifestation.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Was heißt das?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //Nun, ich lehre sie Kreaturen oder Wesenheiten anderer Zustände oder Sphären herbeizurufen.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //Für gewöhnlich spricht man von Beschwörungen, obwohl dieser Ausdruck allein unzureichend ist für die Kunst, einen Diener zu rufen.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Zudem besitze ich einige interessante Spruchrollen, die Gorax nicht hat.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Aber die stelle ich nur Angehörigen des Ordens zur Verfügung.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Meister Karras kann mich im Kloster mit Spruchrollen versorgen. Allerdings muss ich Magier des Feuers sein.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Unterrichte mich (Runen erschaffen)";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Unterrichte mich.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //Du kannst momentan nichts von mir lernen.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will den vierten Kreis der Magie lernen.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Ich will den vierten Kreis der Magie lernen.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Gut. Alle Zeichen sind erfüllt. Tritt nun ein in den vierten Kreis, auf dass dir die Macht der neuen Zauber inne ist.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Du bist einen weiten Weg gegangen und Innos wird ihn auch weiterhin erleuchten.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Noch ist es nicht soweit.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will den fünften Kreis der Magie lernen.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Ich will den fünften Kreis der Magie lernen.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //Dann tritt nun ein, in den fünften Kreis der Magie. Du wirst nun mächtigere Zauber als je zuvor beherrschen.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Nutze ihre Macht weise, Bruder - denn die Dunkelheit ist noch immer stark und so sind deine Feinde.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //In den sechsten und höchsten Kreis der Magie kann ich dich nicht mehr begleiten. Pyrokar selbst wird dich weihen, wenn die Zeit gekommen ist.
			
			B_LogEntry (Topic_KlosterTeacher,"In den sechsten Kreis der Magie wird Meister Pyrokar mich einweihen.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Die Zeit ist noch nicht reif dafür.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Bruder, du darfst keine Zeit verlieren. Du musst Pedro zur Strecke bringen und das Auge Innos zurück ins Kloster bringen.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Wenn wir das Auge nicht wiederbekommen, sind wir alle verloren.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Was machst du hier? Solltest du nicht unterwegs sein und den hinterhältigen Verräter Pedro suchen?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Später. Erst muss ich noch was erledigen.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Er wird nicht weit kommen.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Später. Erst muss ich noch was erledigen.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Weißt du überhaupt, was der Verlust für das Kloster bedeutet? Das Auge Innos ist eine mächtige Waffe.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Niemand kann vorhersagen, was der Feind mit dem Amulett vorhat, aber er hat etwas vor, und das müssen wir vereiteln.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Also setz dich unverzüglich in Bewegung und spür den Dieb auf!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Er wird nicht weit kommen.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //Das will ich für dich hoffen. Wenn er entkommt, weil du hier rumstehst, werde ich dich persönlich vors Tribunal schleifen.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //Was willst du mir vorwerfen?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //Verschwörung mit dem Feind. Die Strafe für so ein Vergehen kannst du dir ja wohl ohne viel Phantasie selbst ausmalen.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Und jetzt solltest du zusehen, dass du keine weitere Zeit verschwendest, sonst sehen wir uns das nächste Mal auf dem Scheiterhaufen wieder.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Du weißt alles, was du wissen musst. Jetzt mach dich auf den Weg!
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"Ich habe das Auge Innos' zurückgebracht.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Ich habe das Auge Innos' zurückgebracht.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //Ich bin erleichtert, dass es dir gelungen ist, dem Feind das Auge zu entreißen.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Aber die Gefahr ist nicht gebannt. Das Böse schmiedet weiterhin Pläne und geht ungewöhnlich aggressiv vor.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //Das ist mir auch schon aufgefallen.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Mach dich nicht über mich lustig. Die Lage ist ernst, sehr ernst, und wir wissen nicht, auf wen wir uns verlassen können.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Dem Feind ist es schon gelungen, den Novizen Pedro in Versuchung zu führen, auch bei vielen anderen könnte er Erfolg haben.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "Was macht das Studium?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //Was macht das Studium?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Es ist mir gelungen, etwas über die Suchenden herauszufinden.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //Und das wäre?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Sie sind ganz offensichtlich dämonischen Ursprungs. Na ja, zumindest stehen sie oder standen sie unter dämonischem Einfluss.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Pass auf, wenn du ihnen begegnest.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Das ist ja mal ganz was Neues.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Tut mir Leid, aber ich habe noch nicht genug Material, um genauere Aussagen zu treffen.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Aber wenn es dir gelingen würde, mir etwas von ihnen zu bringen, das ich untersuchen könnte ...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras braucht etwas, das in direkten Kontakt mit den Suchenden stand, damit er seine Nachforschungen über sie weiter führen kann."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Ich werde sehen, was ich machen kann.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Könnte der Schläfer seine Finger im Spiel haben?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Welches Material benötigst du?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Ich bin noch mit der Auswertung der Indizien über die Suchenden beschäftigt.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Sobald ich was weiß, werde ich dich natürlich direkt unterrichten.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Der Feind hat viele Gesichter. Welche unter ihnen die größte Bedrohung für das Kloster darstellen, ist verdammt schwierig zu bestimmen.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Könnte der Schläfer seine Finger im Spiel haben?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //Ich habe die Geschichte mit dem Schläfer gehört. Aber aus der Ferne kann ich dazu keine Aussage treffen.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Es gibt unzählige Dämonen und jeder von ihnen könnte beteiligt sein.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Soll ich dir eine Leiche bringen?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Nein, bist du wahnsinnig. Die Gefahren eines dämonischen Wesens innerhalb der Klostermauern sind viel zu groß.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Es reicht, wenn du Gegenstände, welche typisch für diese Wesen sind, ausfindig machst.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Die Reste der anhaftenden dämonischen Aura sollten genug Anhaltspunkte für eine Untersuchung bieten.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //Welches Material benötigst du?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Was weiß ich, irgendwelche Gegenstände, die speziell zu diesen Wesen gehören.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Soll ich dir eine Leiche bringen?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Ich werde sehen, was ich tun kann.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //Es wäre sicher von großem Nutzen. Ich werde derweil meine persönlichen Forschungen vorantreiben.
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "Ich habe hier einen Almanach der Besessenen.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Ich habe hier einen Almanach der Besessenen. Vielleicht kannst du damit was anfangen.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Zeig mal her.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Ja, das könnte gehen. Ich werde das Buch untersuchen.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Bei einer Sache bin ich mir allerdings jetzt schon sicher.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //Meines Erachtens handelt es sich bei den Suchenden um eine von Beliar geschaffene, völlig pervertierte Lebensform.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Diese Wesen sind zum Teil dämonischen und zum Teil menschlichen Ursprungs.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Doch ob es sich um eine Art der geistigen Besessenheit oder gar eine rein körperliche Mutation handelt, bin ich mir noch nicht sicher.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Komm später noch mal wieder. Dann weiß ich sicherlich mehr.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras konnte mit einem Almanach der Besessenen weiter forschen. Ich soll später nochmal zu ihm kommen."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "Schon was neues über die Suchenden herausgefunden?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Schon was Neues über die Suchenden herausgefunden?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Ja. Ich weiß jetzt, wer oder was die Suchenden wirklich sind.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Schieß los.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Sie waren einmal Menschen wie du und ich. Sie haben den verabscheuungswürdigen Fehler begangen, sich der unreinen Magie eines sehr mächtigen Erzdämonen zu widmen.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Unter dem Einfluss dieses Erzdämonen und sehr starken Drogen fristeten sie ihr Dasein nur, um ihm zu dienen, bis sie selbst zu einem Schatten ihrer selbst wurden.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Heute sind sie nur noch Werkzeuge des Bösen ohne eigenen Willen und werden niemals damit aufhören, die Anhänger Innos' zu jagen.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Wir müssen vorsichtig sein. Noch scheinen sie diese geheiligten Hallen Innos zu meiden.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Doch wenn ihre Macht noch weiter anwächst, weiß ich nicht, ob wir hier dann noch länger sicher sind.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Danke. Das war sehr aufschlussreich.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Tatsächlich? Für mich wirft das nur noch mehr Fragen auf. Zum Beispiel, wer waren sie vorher und welcher Erzdämon hat sie zu dem gemacht, was sie nun sind.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //Ich habe eine Vermutung. Das alles klingt nach der Bruderschaft des Schläfers. Die Jungs kenne ich.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Ich hoffe, du weißt, worauf du dich da einlässt. Pass auf dich auf, mein Bruder.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Aber ja. Hier hast du deinen Almanach zurück. Ich benötige ihn jetzt nicht mehr.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras Studium war sehr aufschlussreich. Zwischen den Suchenden und der Bruderschaft des Schläfers scheint es einen Zusammenhang zu geben."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Ich arbeite dran. Komm später wieder.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "Gibt es einen Schutz gegen die mentalen Angriffe der Suchenden?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Gibt es einen Schutz gegen die mentalen Angriffe der Suchenden?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //In der Tat. Ein Amulett, das mit Gestein aus gesegneter Erde angefertigt wurde, könnte eine schützende Wirkung haben.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Leider habe ich nicht genug von diesem Gestein vorrätig.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Einige unserer Gebetsschreine, die wir errichtet haben, sind daraus gefertigt worden.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Alles klar. Ich werde etwas davon auftreiben.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Ja, tu das. Aber lass dir bloß nicht einfallen, die Schreine zu beschädigen, hörst du?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras kann mir einen Schutz gegen die mentalen Angriffe der Suchenden beschaffen. Dazu benötigt er Gestein aus gesegneter Erde. Einige Schreine sind aus diesem Gestein gefertigt."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Kein Ahnung. Dazu weiß ich noch zu wenig. Frag mich später noch mal danach.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "Ich habe hier Gestein aus gesegneter Erde.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //Ich habe hier Gestein aus gesegneter Erde.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Gut. Ich hoffe, die Gebetsschreine sind noch alle an ihrem Platz.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //In Ordnung. Ich fertige dir das Schutzamulett gegen den schwarzen Blick der Suchenden.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Gib mir etwas Zeit. Ich mach mich auch gleich an die Arbeit.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras will mir ein Schutzamulett gegen die Mentalen Angriffe der Suchenden geben. Das wird die Sache erleichtern."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "Wie steht's mit dem versprochenen Schutzamulett?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //Wie steht's mit dem versprochenen Schutzamulett?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Ich bin fertig. Hier, sieh es dir an. Es ist ein schönes Stück geworden.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Trage es immer bei dir und die Suchenden werden dich nicht in ihre mentalen Abgründe ziehen können.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Ich danke dir.
		B_LogEntry (TOPIC_DEMENTOREN,"Ich erhielt von Karras ein Schutzamulett gegen den schwarzen Blick der Suchenden."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Noch etwas Geduld. Ich arbeite noch daran.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};


