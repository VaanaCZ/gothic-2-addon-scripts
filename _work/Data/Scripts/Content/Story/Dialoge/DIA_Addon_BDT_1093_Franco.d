///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Franco_EXIT   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 999;
	condition   = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_EXIT_Info()
{
	if (Franco_Exit == FALSE)
	&& (MIS_HlpLogan == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Verlauf dich nicht, sonst endest du noch als Futter für die Haie.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Franco_PICKPOCKET (C_INFO)
{
	npc			= BDT_1093_Addon_Franco;
	nr			= 900;
	condition	= DIA_Franco_PICKPOCKET_Condition;
	information	= DIA_Franco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre gewagt sein Amulett zu stehlen)";
};                       

FUNC INT DIA_Franco_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)
	&& (Npc_HasItems (self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Franco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Franco_PICKPOCKET);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_BACK 		,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItAm_Addon_Franco, 1);
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Franco_PICKPOCKET);
		
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX]	= 196; //boah ey, ist ja ein super trick!
		self.attribute[ATR_HITPOINTS] 		= 196;
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
		
		
	};
};
	
func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Franco_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HI   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 1;
	condition   = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Franco_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Franco_HI_Info()
{	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Wenn ich bei Franco einen guten Job mache, wird er mich in's Lager bringen.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Hey, was willst du hier? Willst du ins Lager?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Ja, ich bin ...
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Interessiert mich nicht, wer du bist. Ich bin Franco, ich bin hier der Anführer.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Also, wenn du hier draußen einen guten Job machst, bringe ich dich ins Lager.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Ramon, der Torwächter, wird dir sagen, ob sie im Lager neue Leute brauchen. Sprich mit ihm.
		B_LogEntry (Topic_Addon_Franco,"Ich soll Ramon, den Torwächter fragen ob sie im Lager neue Leute brauchen.");
	};
};
//---------------------------------------------------------------------
//	Info Mission SumpfHai
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Hai   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 2;
	condition   = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent   = FALSE;
	description = "Thorus braucht einen neuen Mann. ";
};
FUNC INT DIA_Addon_Franco_Hai_Condition()
{	
	if (Ramon_News == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Hai_Info()
{	
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus braucht einen neuen Mann.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Gut. Ich werde mich darum kümmern.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Moment, was ist mit mir?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Du hast noch nichts geleistet.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//Ich hab schon 'ne Menge geleistet, nur weißt DU nichts davon ...
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//Okay, du willst eine Chance? Du kriegst deine Chance. Schwing deinen Hintern zu Logan. Die Sumpfhaie rücken ihm zu sehr auf die Pelle.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Hilf ihm, mit den Viechern fertig zu werden, dann bist du schon so gut wie im Lager.
	
	B_LogEntry (Topic_Addon_Franco,"Franco will, das ich Logan helfe, bevor er mich in's Lager schickt.");
};
//---------------------------------------------------------------------
//	Info Logan Wo?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Wo   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 3;
	condition   = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich Logan?";
};
FUNC INT DIA_Addon_Franco_Wo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	&& (!Npc_IsDead (Logan))
	&& (MIS_HlpLogan == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Wo_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//Wo finde ich Logan?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Wenn du vorm Lagereingang stehst, geh an der Felswand links entlang. Es ist ein Stück weit im Sumpf.
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Logan tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tot   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 5;
	condition   = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent   = FALSE;
	description = "Logan ist tot.";
};
FUNC INT DIA_Addon_Franco_tot_Condition()
{	
	if (MIS_HlpLogan != LOG_SUCCESS)
	&&  Npc_IsDead (Logan)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tot_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan ist tot.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Verdammt. Er war der beste Jäger, den wir draußen hatten. Verfluchter Mist.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Wie dem auch sei, ich habe schon jemand anders ins Lager geschickt.
	
	if (MIS_HlpLogan == LOG_RUNNING)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};
//---------------------------------------------------------------------
//	Info Logan Success HAISUCCESS
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HaiSuccess   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 6;
	condition   = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent   = FALSE;
	description = "Ich hab' Logan geholfen...";
};
FUNC INT DIA_Addon_Franco_HaiSuccess_Condition()
{	
	if (MIS_HlpLogan == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_HaiSuccess_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//Ich hab' Logan geholfen ...
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//... aber er hat's nicht überlebt.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//Okay, du hast gegen die Sumpfhaie gekämpft - du bist zu gebrauchen - zumindest mehr, als die meisten Typen hier.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"Das ich Logan geholfen habe, reicht nicht, damit Franco mich in's Lager schickt. ");
};

//---------------------------------------------------------------------
//	Mis 2 (Edgor)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Mis2 (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 7;
	condition   = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent   = FALSE;
	description = "Also kann ich jetzt ins Lager?";
};
FUNC INT DIA_Addon_Franco_Mis2_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	|| (Npc_KnowsInfo (other, DIA_Addon_Franco_tot))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Mis2_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Also kann ich jetzt ins Lager?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//Pass auf - es gibt da noch eine Sache, für die ich dich brauche.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//Vor ein paar Tagen habe ich Edgor in den Sumpf geschickt.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//Er sollte mir eine alte Steintafel besorgen - aber seitdem hat er sich nicht mehr blicken lassen.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Sieh nach, was er treibt, und bring mir diese verdammte Steintafel.
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franco will eine Steintafel haben, die Edgor ihm bringen sollte. Jetzt soll ich mich darum kümmern.");
	
	B_LogEntry (Topic_Addon_Franco,"Franco will, das ich jetzt Edgor helfe, bevor er mich in's Lager schickt.");
};

//---------------------------------------------------------------------
//	Info Logan While
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_While   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 8;
	condition   = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent   = FALSE;
	description = "Wie sieht's aus mit Gold?";
};
FUNC INT DIA_Addon_Franco_While_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_HaiSuccess))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_While_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//Wie sieht's aus mit Gold?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Was?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Kriege ich auch was für meine Arbeit hier im Sumpf?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//(superfreundlich) Du willst Gold? Klar, wie viel willst du? Fünfzig Goldbrocken? Hundert? Ich gebe dir soviel Gold, wie du tragen kannst ...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//(laut) Was glaubst du, wer du bist? Willst du mich verarschen?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//Jetzt schieb ab und tu was!  Sonst gibt's nicht mal einen GOLDKRÜMEL für dich!!
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info WOEDGOR
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_WOEDGOR   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 9;
	condition   = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent   = TRUE;
	description = "Also, WO finde ich diesen Edgor? ";
};
FUNC INT DIA_Addon_Franco_WOEDGOR_Condition()
{	
	if (MIS_HlpEdgor == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Addon_Stone_04 ) < 1)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_WOEDGOR_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //(seufzt) Also, WO finde ich diesen Edgor?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Willst du den einfachen Weg oder den schnellen?
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Ich nehme den schnellen." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Erklär mir den einfachen Weg." ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Da sind überall Ruinen. Irgendwo dort sitzt er rum.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //Ich denke mal, er war schlau genug, sich ein Feuer anzumachen, DAS wirst du ja wohl finden.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Erklär mir den einfachen Weg.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //Folge dem Steg bis zum vorderen Tor. Da müsste Sancho stehen.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Geh dort links und folge dem Steg.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Ich nehme den schnellen.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //Okay. Geh von hier aus schräg links am Steg vorbei in den Sumpf.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};
//---------------------------------------------------------------------
//	Info tafel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tafel   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 10;
	condition   = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent   = FALSE;
	description = "Hier ist die Steintafel.";
};
FUNC INT DIA_Addon_Franco_tafel_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04 ) >= 1)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tafel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Hier ist die Steintafel.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Gut, sehr gut. Raven wird mit dir zufrieden sein.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"Ich habe Franco die Steintafel gebracht, die er wollte.");
};

//---------------------------------------------------------------------
//	JemandAnderen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_JemandAnderen   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 11;
	condition   = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent   = FALSE;
	description = "Was ist jetzt mit dem Lager? Kann ich endlich rein?";
};
FUNC INT DIA_Addon_Franco_JemandAnderen_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_tafel))
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_JemandAnderen_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//Was ist jetzt mit dem Lager? Kann ich endlich rein?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//Nein, ich habe Logan reingeschickt. Er stand vor dir auf der Liste.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//Nein, ich habe bereits jemand anderen geschickt.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//Und für einen weiteren Mann ist zurzeit kein Bedarf im Lager.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//Außerdem kann ich dich hier gut gebrauchen, (grinst) jetzt, wo Logan nicht mehr da ist.
		
	B_LogEntry (Topic_Addon_Franco,"Franco schickt mich nicht ins Lager. Ich glaube ich muss das Franco - Problem aus dem Weg räumen...");
};

//---------------------------------------------------------------------
//	Info Fight
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Fight   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 12;
	condition   = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent   = TRUE;
	description = "Schick mich JETZT rein!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //Schick mich JETZT rein!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //(gefährlich freundlich) Und was, wenn ich nein sage?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Dann warte ich eben noch ein bißchen..." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Dann wirst du es eben bereuen." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Dann wirst du es eben bereuen.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Willst du mir drohen? DU? Willst MIR drohen? - Es ist wohl Zeit für eine Lektion ...
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //Dann warte ich eben noch ein bisschen ...
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //(spöttisch) Genau.
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info Fight2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Pig   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 13;
	condition   = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent   = TRUE;
	description = "Du Schwein! Ich mach dich fertig!";
};
FUNC INT DIA_Addon_Franco_Pig_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Pig_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Du Schwein! Ich mach dich fertig!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//(gepreßt) Du mieser kleiner Wicht willst dich mit MIR anlegen? Na warte!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




