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
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Je mi líto, ale teď nemám čas.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Musím cvičit.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "Kaňon čeká.";
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
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //Kaňon čeká.
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
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Nemůžu si stěžovat. Trochu nuda, ale aspoň nemusím makat.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Chystám se na další úkol, který mi zadal Greg.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Jakej úkol?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //To nesmím říct.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Nic ve zlým, hochu. Ale já si to privilegium dost tvrdě vydřel a už ho nechci ztratit.
	
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
	description = "Můžeš mě něčemu naučit?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Můžeš mě něco naučit?
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
	description = "Kdo by mě tu tak něco naučil?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Kdo by mě tu něco naučil?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry a Morgan vedou naše přepadový oddíly.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Můžou tě naučit líp bojovat.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Všichni Henryho lidi bojujou s obouručníma zbraněma.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan má zas radši rychlejší jednoručky.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Kdo dál?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Nevím, vo nic jinýho jsem se nikdy nezajímal.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Ale pár triků by tě určitě naučil i Krokodýl Jack nebo Samuel.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "Můžeš mi prozradit něco o Francisovi?";
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
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Můžeš mi říct něco o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Jen se kolem sebe rozhlídni. Jedinej, kdo tu maká, je Henry a jeho lidi.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan se celý dny válí v posteli nebo nasává jak houba.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //A na Grega nezkoušej žádný nesmysly – jestli se nebudeš držet v lati, nakope ti zadek.
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
	description = "Dej mi tu zbroj banditů.";
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
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Dej mi tu zbroj banditů.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Takovej blázen nejsem. Greg by mi utrhnul hlavu.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Výslovně řek, že tu zbroj nikdo nedostane, pokud to von vosobně nenařídí.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Nemůžu ti ji dát. Zvlášť když se Greg ještě nevrátil.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones mi nedá zbroj, dokud mu to nepovolí Greg."); 
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "Máš mi dát zbroj banditů. Rozkaz od Grega.";
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
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Máš mi dát brnění banditů. Rozkaz přímo od Grega.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //Od Grega? No, už jsem myslel, že tam budu muset jít já.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //Dělat špióna v táboře banditů je pěkně o držku.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Radši bych Gregovi uklízel v chatrči, než abych se nechal zabít vod banditů.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(rozčileně) A co ta zbroj?
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //No jo, jasně, tady je.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Ale buď vopatrnej, ti banditi jsou pěkná chátra.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Rozkaz od Grega dokázal nemožné: nyní mám zbroj banditů!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

