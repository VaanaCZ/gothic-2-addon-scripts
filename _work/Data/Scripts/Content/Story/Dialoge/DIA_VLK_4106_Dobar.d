///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Dobar_EXIT   (C_INFO)
{
	npc         = VLK_4106_Dobar;
	nr          = 999;
	condition   = DIA_Dobar_EXIT_Condition;
	information = DIA_Dobar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4106_Dobar;
	nr		 	 = 	2;
	condition	 = 	DIA_Dobar_HALLO_Condition;
	information	 = 	DIA_Dobar_HALLO_Info;
	permanent 	 =  FALSE;
	important	 =  TRUE;
};
func int DIA_Dobar_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Dobar_HALLO_Info ()
{
	
	AI_Output (self, other, "DIA_Dobar_HALLO_08_00"); //Czego?
};
///////////////////////////////////////////////////////////////////////
//	Info Ich verstehe mich auf's schmieden.
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Talent		(C_INFO)
{
	npc		 	 = 	VLK_4106_Dobar;
	nr		 	 = 	3;
	condition	 = 	DIA_Dobar_Talent_Condition;
	information	 = 	DIA_Dobar_Talent_Info;
	permanent 	 =  FALSE;
	description	 =  "Wiem co nieco na temat pracy w ku�ni.";
};
func int DIA_Dobar_Talent_Condition ()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_SMITH) > 0)  
	{
		return TRUE;
	};
};
func void DIA_Dobar_Talent_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Talent_15_00"); //Wiem co nieco na temat pracy w ku�ni.
	AI_Output (self, other, "DIA_Dobar_Talent_08_01"); //�wietnie... i co z tego?
};
///////////////////////////////////////////////////////////////////////
//	Info Schmiede
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Schmiede		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	3;
	condition	 = 	DIA_Dobar_Schmiede_Condition;
	information	 = 	DIA_Dobar_Schmiede_Info;
	permanent 	 =  FALSE;
	description	 = 	"Czy mog� skorzysta� z twojej ku�ni?";
};

func int DIA_Dobar_Schmiede_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Dobar_Talent)
	{	
		return TRUE;
	};
};
func void DIA_Dobar_Schmiede_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Schmiede_15_00"); //Czy mog� skorzysta� z twojej ku�ni?
	AI_Output (self, other, "DIA_Dobar_Schmiede_08_01"); //Mam wiele do zrobienia. Tylko wchodziliby�my sobie nawzajem w drog�. Zaczekaj, a� si� �ciemni.
	AI_Output (self, other, "DIA_Dobar_Schmiede_08_02"); //Wtedy ja i Parlaf p�jdziemy spa�, a ty mo�esz tu sobie pracowa� bez przeszk�d.
};
///////////////////////////////////////////////////////////////////////
//	Info beibringen
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_beibringen		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	2;
	condition	 = 	DIA_Dobar_beibringen_Condition;
	information	 = 	DIA_Dobar_beibringen_Info;
	permanent 	 =  FALSE;
	description	 = 	"Mo�esz mnie czego� nauczy�?";
};

func int DIA_Dobar_beibringen_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Dobar_Talent)
	{	
		return TRUE;
	};
};
func void DIA_Dobar_beibringen_Info ()
{
	AI_Output (other, self, "DIA_Dobar_beibringen_15_00"); //Czy mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Dobar_beibringen_08_01"); //Tak wi�c znasz ju� podstawy. Mog� ci pom�c udoskonali� twoje umiej�tno�ci.
	AI_Output (self, other, "DIA_Dobar_beibringen_08_02"); //B�dziesz m�g� wtedy wyrabia� lepsz� bro�.
	
	Dobar_Learnsmith = TRUE;
	Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher_OC, "Dobar mo�e mnie nauczy�, jak wykuwa� lepszy or�.");
};
///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Teach		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	3;
	condition	 = 	DIA_Dobar_Teach_Condition;
	information	 = 	DIA_Dobar_Teach_Info;
	description	 = 	B_BuildLearnString ("Poka� mi, jak wyku� dobry miecz!", B_GetLearnCostTalent (other, NPC_TALENT_SMITH, WEAPON_1H_Special_01));
	permanent	 =  TRUE;
};
func int DIA_Dobar_Teach_Condition ()
{	
	if (Dobar_Learnsmith == TRUE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Dobar_Teach_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Teach_15_00"); //Poka� mi, jak wyku� dobry miecz!
	
	if B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_01) 
	{	
		AI_Output (self, other, "DIA_Dobar_Teach_08_01"); //Upewnij si�, �e stal jest r�wnomiernie rozgrzana - pozwoli ci to uzyska� r�wne, g�adkie ostrze.
		AI_Output (self, other, "DIA_Dobar_Teach_08_02"); //Je�li b�dziesz o tym pami�ta�, twoje miecze stan� si� twardsze i ostrzejsze.
		AI_Output (self, other, "DIA_Dobar_Teach_08_03"); //To ju� ca�a niezb�dna wiedza. Je�li b�dziesz potrzebowa� stali, porozmawiaj z Engorem.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Waffe		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	80;
	condition	 = 	DIA_Dobar_Waffe_Condition;
	information	 = 	DIA_Dobar_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mo�esz zrobi� dla mnie bro�?";
};
func int DIA_Dobar_Waffe_Condition ()
{
	return TRUE;
};
func void DIA_Dobar_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Waffe_15_00"); //Mo�esz zrobi� dla mnie bro�?
	AI_Output (self, other, "DIA_Dobar_Waffe_08_01"); //Nie mam na to czasu. Ja tylko kuj� bro�, a Parlaf j� ostrzy. Wydawaniem or�a zajmuje si� Tandor.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor handluje na zamku broni�.");
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_NEWS		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	900;
	condition	 = 	DIA_Dobar_NEWS_Condition;
	information	 = 	DIA_Dobar_NEWS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak praca?";
};
func int DIA_Dobar_NEWS_Condition ()
{
	return TRUE;
};
func void DIA_Dobar_NEWS_Info ()
{
	
	
	AI_Output (other, self, "DIA_Dobar_NEWS_15_00"); //Jak praca?
	
	if (Dobar_einmalig == FALSE)
	{
		AI_Output (self, other, "DIA_Dobar_NEWS_08_01"); //Zajmuj� si� kuciem or�a dla zamkowych rycerzy. Odk�d si� tu znale�li�my, wci�� produkuj� now� bro�.
		AI_Output (self, other, "DIA_Dobar_NEWS_08_02"); //B�dzie nam potrzebna. Poka�emy tym przekl�tym orkom, jak smakuje stal naszych mieczy!

		if ((Npc_IsDead(Parlaf)) == FALSE)
		{
			B_TurnToNpc (self, Parlaf);
			AI_Output (self, other, "DIA_Dobar_NEWS_08_03"); //Hej, Parlaf, pami�taj, �eby dobrze naostrzy� te miecze - tacy orkowie potrafi� by� naprawd� twardzi!
			B_TurnToNpc (self, other); 
		};
		Dobar_einmalig = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Dobar_NEWS_08_04"); //Mog�o by� lepiej. Gdyby� mi ci�gle nie przerywa�, mo�e uda�oby mi si� wreszcie co� zrobi�.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dobar_PICKPOCKET (C_INFO)
{
	npc			= VLK_4106_Dobar;
	nr			= 900;
	condition	= DIA_Dobar_PICKPOCKET_Condition;
	information	= DIA_Dobar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tej bry�ki rudy b�dzie trudna)";
};                       

FUNC INT DIA_Dobar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItMI_Nugget) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (79 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Dobar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dobar_PICKPOCKET);
	Info_AddChoice		(DIA_Dobar_PICKPOCKET, DIALOG_BACK 		,DIA_Dobar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dobar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dobar_PICKPOCKET_DoIt);
};

func void DIA_Dobar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 79)
	{
		B_GiveInvItems (self, other, ItMI_Nugget, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Dobar_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Dobar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dobar_PICKPOCKET);
};
















