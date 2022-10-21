// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Bartok_EXIT   (C_INFO)
{
	npc         = VLK_440_Bartok;
	nr          = 999;
	condition   = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bartok_PICKPOCKET (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 900;
	condition	= DIA_Bartok_PICKPOCKET_Condition;
	information	= DIA_Bartok_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach sein Pfeilbündel zu stehlen)";
};                       

FUNC INT DIA_Bartok_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItRw_Arrow) >= 40)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Bartok_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bartok_PICKPOCKET);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_BACK 		,DIA_Bartok_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bartok_PICKPOCKET_DoIt);
};

func void DIA_Bartok_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItRw_Arrow, 40);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Bartok_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel(); 
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Bartok_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bartok_PICKPOCKET);
};

// *****************************************************
//						Hallo
// *****************************************************
INSTANCE DIA_Bartok_Hallo (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Hallo_Condition;
	information	= DIA_Bartok_Hallo_Info;
	permanent	= FALSE;
	description = "Wie sieht's aus?";
};                       
FUNC INT DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bartok_Hallo_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Hello_15_00"); //Wie sieht's aus?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_01"); //Du kommst wohl nicht von hier, was? Mach dir nichts draus - ich auch nicht.
	AI_Output (other ,self,"DIA_Bartok_Hello_15_02"); //Wo hast du dich vorher rumgetrieben?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_03"); //In den Wäldern. Dort habe ich Scavenger und Wölfe gejagt. Zusammen mit ein paar anderen Jägern.
	AI_Output (self ,other,"DIA_Bartok_Hello_04_04"); //Aber das hab ich aufgegeben. Die Zeiten sind gefährlich. Da draussen läuft viel Gesindel rum...
};
// *****************************************************
//						Jaeger
// *****************************************************
INSTANCE DIA_Bartok_Jaeger(C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 2;
	condition	= DIA_Bartok_Jaeger_Condition;
	information	= DIA_Bartok_Jaeger_Info;
	permanent	= FALSE;
	description	= "Wo kann ich die anderen Jäger finden?";
};                       
FUNC INT DIA_Bartok_Jaeger_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Jaeger_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Jager_15_00"); //Wo kann ich die anderen Jäger finden?
	AI_Output (self ,other,"DIA_Bartok_Jager_04_01"); //Wir hatten unser Lager draussen, in der Nähe der Taverne. Auf halbem Weg zu Onars Hof.
	AI_Output (self ,other,"DIA_Bartok_Jager_04_02"); //Aber ob jetzt noch einer im Lager ist, weiß ich nicht.
	
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_00"); //Bis vor einigen Tagen waren wir noch zu zweit hier in der Stadt.
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_01"); //Mein Freund Trokar ist ein hervorragender Jäger.
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bartok_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_440_Bartok;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bartok_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bartok_MissingPeople_Info;

	description	 = 	"Wo ist dein Freund Trokar jetzt?";
};

func int DIA_Addon_Bartok_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Jaeger))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bartok_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bartok_MissingPeople_15_00"); //Wo ist dein Freund Trokar jetzt?
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_01"); //Tja. Das ist eine merkwürdige Geschichte.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_02"); //Erst bis vor einigen Tagen noch standen wir beide an der Theke in Coragons Taverne und sprachen über die Jagd.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_03"); //Frag mich nicht, was dann passierte. Ich hatte schon einiges getrunken.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_04"); //Ich weiß nur noch, dass Trokar sagte, er wolle eben ein paar Sumpfkrautstängel besorgen und kam nicht wieder.

	MIS_Bartok_MissingTrokar = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "Hast du nicht nach ihm gesucht?", DIA_Addon_Bartok_MissingPeople_such );
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "Wo bekommt man denn Sumpfkrautstengel?", DIA_Addon_Bartok_MissingPeople_wo );
};
func void DIA_Addon_Bartok_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_wo_15_00"); //Wo bekommt man denn Sumpfkrautstängel?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_wo_04_01"); //Soviel ich weiß, irgendwo am Hafen.
};
func void DIA_Addon_Bartok_MissingPeople_such ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_such_15_00"); //Hast du nicht nach ihm gesucht?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_01"); //Das nicht. Aber ich hab's der Miliz gemeldet.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_02"); //Die haben ihn aber auch noch nicht finden können.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_03"); //Will nicht hoffen, dass ihn ein Wolf angefallen hat oder noch Schlimmeres.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_04"); //Ich hab Angst, dass ich eines Tages bei der Jagd über seine Leiche stolpere.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_05"); //Ich fürchte, das würde ich nicht verkraften.
};

// *****************************************************
//						Bosper
// *****************************************************
INSTANCE DIA_Bartok_Bosper (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 3;
	condition	= DIA_Bartok_Bosper_Condition;
	information	= DIA_Bartok_Bosper_Info;
	permanent	= FALSE;
	description	= "Bosper sagte, du hättest für ihn gearbeitet...";
};                       
FUNC INT DIA_Bartok_Bosper_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bosper_Bartok))
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Bosper_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_00"); //Bosper sagte, du hättest für ihn gearbeitet...
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_01"); //Ja, hab ich. Aber ihn haben nur seine Scheiß Felle interessiert.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_02"); //Ich hab ihm gesagt, wie gefährlich es da draussen geworden ist. Er hat mir gar nicht richtig zugehört.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_03"); //Naja, immerhin hat er gut gezahlt - darüber konnte ich mich nie beklagen.
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_04"); //Kannst du mir sonst noch was über ihn erzählen?
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_05"); //(lacht) Letztens wurde Bosper einer seiner Bögen gestohlen. Am hellichten Tage.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_06"); //So'n Typ ist einfach bei ihm reinmarschiert und hat sich 'nen Bogen mitgenommen.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_07"); //Die Diebe werden auch immer dreister!
	
	if (MIS_Bosper_Bogen != LOG_SUCCESS) 
	{    
		MIS_Bosper_Bogen = LOG_RUNNING;
	};   
};
	
// *****************************************************
//						WannaLearn
// *****************************************************
INSTANCE DIA_Bartok_WannaLearn (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_WannaLearn_Condition;
	information	= DIA_Bartok_WannaLearn_Info;
	permanent	= FALSE;
	description	= "Kannst du mir etwas über die Jagd beibringen?";
};                       
FUNC INT DIA_Bartok_WannaLearn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_WannaLearn_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_WannaLearn_15_00"); //Kannst du mir etwas über die Jagd beibringen?
	AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_01"); //Ich kann dir beibringen, wie du dich richtig anschleichst und wie du mit dem Bogen umgehst.
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_02"); //Wenn du lernen willst, wie man Tieren das Fell abzieht, geh zu Bosper. Er hat's mir damals auch beigebracht.
	};
	
	Bartok_TeachPlayer = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Bartok  kann mir den Umgang mit dem Bogen und das Schleichen beibringen.");
};

// *****************************************************
//						TeachSneak
// *****************************************************
INSTANCE DIA_Bartok_TeachSneak (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_TeachSneak_Condition;
	information	= DIA_Bartok_TeachSneak_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString ("Bring mir bei, wie man schleicht!", B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};                       
FUNC INT DIA_Bartok_TeachSneak_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_TeachSneak_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_TeachSneak_15_00"); //Bring mir bei, wie man schleicht!
	
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
	{
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_01"); //Gut - also zuerst mal mußt du darauf achten, daß du dein Gewicht richtig verlagerst.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_02"); //Geh am besten in die Knie und setz den Fuß immer zuerst mit der Hacke auf.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_03"); //Achte darauf, daß du dein Gewicht auf dem Fuß läßt, auf dem du stehst, bis du den anderen Fuß sicher aufgesetzt hast.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_04"); //An die meisten Viecher kannst du dich nicht ranschleichen, es sei denn, sie schlafen. Die Biester wittern dich nämlich.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_05"); //Also pass immer gut auf, wenn du draussen unterwegs bist.
	};
};

// *****************************************************
//						TEACH
// *****************************************************
var int Bosper_MerkeBow;
// ---------------------

INSTANCE DIA_Bartok_Teach (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_Teach_Condition;
	information	= DIA_Bartok_Teach_Info;
	permanent	= TRUE;
	Description = "Ich will besser mit dem Bogen umgehen können!";
};                       
FUNC INT DIA_Bartok_Teach_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Bartok_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Bartok_TeachBow_15_00"); //Ich will besser mit dem Bogen umgehen können!
	AI_Output (self ,other,"DIA_Bartok_TeachBow_04_01"); //Okay, dann lass uns mal sehen, ob ich dir was beibringen kann...
	
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	
	Info_ClearChoices (DIA_Bartok_Teach);
	
	Info_AddChoice		(DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};

FUNC VOID DIA_Bartok_Teach_BACK()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00"); //Du sollest dir jetzt jemanden suchen, der mehr davon versteht als ich.
	}
	else if (Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01"); //Na also, du bist schon treffsicherer geworden.
	};
	
	Info_ClearChoices (DIA_Bartok_Teach);
};

FUNC VOID DIA_Bartok_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 60);
	
	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};
FUNC VOID DIA_Bartok_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 60);

	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);	
};

// *****************************************************
//						Zusammen
// *****************************************************
var int Bartok_Bereit; 
var int Bartok_Later;
// ---------------------------

INSTANCE DIA_Bartok_Zusammen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_Zusammen_Condition;
	information	= DIA_Bartok_Zusammen_Info;
	permanent	= TRUE;
	description	= "Was ist, wenn wir zusammen auf die Jagd gehen?";
};                       
FUNC INT DIA_Bartok_Zusammen_Condition()
{
	if (Bartok_Bereit == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Zusammen_Info()
{	
	if (Bartok_Later == FALSE)
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_00"); //Was ist, wenn wir zusammen auf die Jagd gehen?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_01"); //Hmm. Zu zweit ist es nicht mehr so gefärlich, das stimmt schon...
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_02"); //Verstehst du denn was vom Jagen?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_03"); //Ich meine, weißt du wie man Tieren das Fell abzieht?
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if (Bartok_Later == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_HuntNOW_04_01"); //Hast du die 50 Goldstücke?
		}
		else
		{
			AI_Output (other ,self,"DIA_Bartok_Zusammen_15_04"); //Ja.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_05"); //Na gut, aber ich will 50 Goldstücke sehen. Dafür kannst du dann die Felle behalten und an Bosper verkaufen.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_06"); //Ist ein fairer Deal, oder?
		};
		
		Info_ClearChoices (DIA_Bartok_Zusammen);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Später...", DIA_Bartok_Zusammen_Later);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Hier sind sie...", DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_07"); //Nein.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_08"); //Dann bringt die ganze Sache ja wohl nicht viel.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_09"); //Komm wieder, wenn du das gelernt hast.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_Later_15_00"); //Später...
	Bartok_Later = TRUE;
	Info_ClearChoices (DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices (DIA_Bartok_Zusammen);
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (other ,self,"DIA_Bartok_HuntNOW_GO_15_00"); //Hier sind sie...
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_03"); //Wo denn? Du hast das Gold nicht.
	};
};


// *****************************************************
//						HuntNOW
// *****************************************************
var int Bartok_Los;
// ----------------------

INSTANCE DIA_Bartok_HuntNOW (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_HuntNOW_Condition;
	information	= DIA_Bartok_HuntNOW_Info;
	permanent	= FALSE;
	description	= "Lass uns Jagen gehen!";
};                       
FUNC INT DIA_Bartok_HuntNOW_Condition()
{
	if (Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_HuntNOW_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_15_00"); //Lass uns Jagen gehen!
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_01"); //Gut, folge mir. Vor dem Südtor ist ein Wald, dort sollten wir mehr als genug Viecher finden.
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_02"); //(zu sich selbst) Wahrscheinlich mehr, als uns lieb sind...
	Bartok_Los = TRUE;
		
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "GUIDEMITTE");
	
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02"); 
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
};

// *****************************************************
//						Im Wald
// *****************************************************
var int Bartok_OrkStillThere;
// ---------------------

INSTANCE DIA_Bartok_ImWald (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_ImWald_Condition;
	information	= DIA_Bartok_ImWald_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_ImWald_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_03") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_ImWald_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_ImWald_04_00"); //So, was denkst du, sollen wir noch weiter in den Wald gehen oder nicht?
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	Info_AddChoice	  (DIA_Bartok_ImWald, "Lass uns zurück gehen!", DIA_Bartok_ImWald_NachHause);
	Info_AddChoice	  (DIA_Bartok_ImWald, "Gehen wir weiter.", DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_NachHause_15_00"); //Lass uns zurück gehen!
	AI_Output (self ,other,"DIA_Bartok_ImWald_NachHause_04_01"); //Ist mit auch lieber. Am Ende laufen wir noch einem Ork in die Arme..
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_Weiter_15_00"); //Gehen wir weiter.
	AI_Output (self ,other,"DIA_Bartok_ImWald_Weiter_04_01"); //Na schön. (zu sich) Wenn das mal gutgeht...
	
	if (!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "GUIDEENDE");
};

// *****************************************************
//						Angekommen
// *****************************************************
var int Bartok_Ende;
// -------------------

INSTANCE DIA_Bartok_Angekommen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Angekommen_Condition;
	information	= DIA_Bartok_Angekommen_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_Angekommen_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_07") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Angekommen_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_00"); //Das war's! Ich denke, ich gehe in die Stadt zurück.
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_01"); //Hier draussen ist es mir einfach zu gefährlich - selbst zu zweit.
	
	if (Bartok_OrkStillThere == TRUE)
	//&& (Npc_IsDead (CityOrc))
	{
		B_Bartok_ShitAnOrc();
		
		Bartok_OrkGesagt = TRUE;
	};
	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_03"); //Also mach's gut!
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_04"); //Du kannst die Felle ja an Bosper verkaufen.
	
	Bartok_Ende = TRUE;
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
	
};

// *****************************************************
//							PERM
// *****************************************************
INSTANCE DIA_Bartok_PERM (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_PERM_Condition;
	information	= DIA_Bartok_PERM_Info;
	permanent	= TRUE;
	description = "Alles klar?";
};                       
FUNC INT DIA_Bartok_PERM_Condition()
{
	if (Bartok_Los == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_PERM_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_PERM_15_00"); //Alles klar?
	
	if (Bartok_Ende == TRUE)
	{		
		AI_Output (self ,other,"DIA_Bartok_PERM_04_01"); //Ja. Aber vor die Stadt gehe ich nicht mehr - zumindest nicht in nächster Zeit.
		if (Bartok_OrkGesagt == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_PERM_04_02"); //Der Schreck mit dem Ork steckt mir immer noch in den Knochen.
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_PERM_04_03"); //Klar. Lass uns ein paar Viecher erlegen!
	};
};








