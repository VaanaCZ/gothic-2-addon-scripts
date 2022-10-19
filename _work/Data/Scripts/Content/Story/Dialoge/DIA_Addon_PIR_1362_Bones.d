// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Je mi lÌto, ale teÔ nem·m Ëas.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //MusÌm cviËit.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "KaÚon Ëek·.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //KaÚon Ëek·.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "Jak se vede?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Jak to jde?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Nem˘ûu si stÏûovat. Trochu nuda, ale aspoÚ nemusÌm makat.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Chyst·m se na dalöÌ ˙kol, kter˝ mi zadal Greg.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Jakej ˙kol?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //To nesmÌm ¯Ìct.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Nic ve zl˝m, hochu. Ale j· si to privilegium dost tvrdÏ vyd¯el a uû ho nechci ztratit.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "M˘ûeö mÏ nÏËemu nauËit?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //M˘ûeö mÏ nÏco nauËit?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "Kdo by mÏ tu tak nÏco nauËil?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Kdo by mÏ tu nÏco nauËil?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry a Morgan vedou naöe p¯epadov˝ oddÌly.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //M˘ûou tÏ nauËit lÌp bojovat.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Vöichni Henryho lidi bojujou s obouruËnÌma zbranÏma.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan m· zas radöi rychlejöÌ jednoruËky.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Kdo d·l?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //NevÌm, vo nic jin˝ho jsem se nikdy nezajÌmal.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Ale p·r trik˘ by tÏ urËitÏ nauËil i Krokod˝l Jack nebo Samuel.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weiﬂt du ¸ber Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "M˘ûeö mi prozradit nÏco o Francisovi?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //M˘ûeö mi ¯Ìct nÏco o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Jen se kolem sebe rozhlÌdni. Jedinej, kdo tu mak·, je Henry a jeho lidi.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan se cel˝ dny v·lÌ v posteli nebo nas·v· jak houba.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //A na Grega nezkouöej û·dn˝ nesmysly ñ jestli se nebudeö drûet v lati, nakope ti zadek.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Dej mi tu zbroj bandit˘.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Dej mi tu zbroj bandit˘.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Takovej bl·zen nejsem. Greg by mi utrhnul hlavu.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //V˝slovnÏ ¯ek, ûe tu zbroj nikdo nedostane, pokud to von vosobnÏ nena¯ÌdÌ.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Nem˘ûu ti ji d·t. Zvl·öù kdyû se Greg jeötÏ nevr·til.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones mi ned· zbroj, dokud mu to nepovolÌ Greg."); 
};

//*********************************************************
//	Du sollst mir die R¸stung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "M·ö mi d·t zbroj bandit˘. Rozkaz od Grega.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //M·ö mi d·t brnÏnÌ bandit˘. Rozkaz p¯Ìmo od Grega.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //Od Grega? No, uû jsem myslel, ûe tam budu muset jÌt j·.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //DÏlat öpiÛna v t·bo¯e bandit˘ je pÏknÏ o drûku.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Radöi bych Gregovi uklÌzel v chatrËi, neû abych se nechal zabÌt vod bandit˘.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(rozËilenÏ) A co ta zbroj?
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //No jo, jasnÏ, tady je.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Ale buÔ vopatrnej, ti banditi jsou pÏkn· ch·tra.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Rozkaz od Grega dok·zal nemoûnÈ: nynÌ m·m zbroj bandit˘!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

