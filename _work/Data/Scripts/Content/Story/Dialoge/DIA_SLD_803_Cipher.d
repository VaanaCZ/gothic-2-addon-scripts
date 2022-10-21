// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Cipher_EXIT(C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 999;
	condition	= DIA_Cipher_EXIT_Condition;
	information	= DIA_Cipher_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cipher_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Cipher_Hello (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 1;
	condition	= DIA_Cipher_Hello_Condition;
	information	= DIA_Cipher_Hello_Info;
	permanent	= FALSE;
	description = "Jak leci?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Jak siê sprawy maj¹?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Hej, czy ja ciê sk¹dœ nie znam?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //To ca³kiem mo¿liwe...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //W Kolonii zajmowa³em siê bagiennym zielem, pamiêtasz?
};

// ************************************************************
// 			  					TradeWhat 
// ************************************************************

instance DIA_Cipher_TradeWhat (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TradeWhat_Condition;
	information	= DIA_Cipher_TradeWhat_Info;
	permanent	= FALSE;
	description = "A w czym teraz siedzisz?";
};                       

FUNC INT DIA_Cipher_TradeWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TradeWhat_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //A w czym teraz siedzisz?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ach, nie pytaj.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //Przynios³em ze sob¹ z kolonii górniczej du¿¹ paczkê bagiennego ziela.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Sporo najemników lubi sobie czasem zapaliæ, zgromadzi³em wiêc na boku ma³¹ fortunkê.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Ale jakiœ gnojek ukrad³ mi ca³y zapas ze skrzyni!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Najemnik Cipher straci³ paczkê bagiennego ziela.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Jestem prawie pewien, ¿e to by³ Bodo. Œpi w tym samym pokoju co ja i zawsze szczerzy siê do mnie jak idiota...
		B_LogEntry (Topic_CipherPaket, "Podejrzewa, ¿e ukrad³ j¹ Bodo.");
	};
	
	MIS_Cipher_Paket = LOG_RUNNING;
};

// ************************************************************
// 			  					DoWithThief 
// ************************************************************

instance DIA_Cipher_DoWithThief (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DoWithThief_Condition;
	information	= DIA_Cipher_DoWithThief_Info;
	permanent	= FALSE;
	description = "Co w takim razie zrobisz ze z³odziejem?";
};                       

FUNC INT DIA_Cipher_DoWithThief_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DoWithThief_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Co w takim razie zrobisz ze z³odziejem?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Pewnego dnia z³apiê go, jak bêdzie pali³ moje ziele.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //A wtedy znajdê spokojne miejsce i dam mu lekcjê, której nie zapomni.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Jak spiorê go tutaj, na œrodku podwórka, to zobacz¹ mnie wieœniacy i nie wyrobiê na grzywny.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //To znaczy?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //To doœæ proste. Nie mo¿emy gnêbiæ ch³opów, bo Lee ka¿e nam za to p³aciæ wysokie grzywny. Onar tak to zorganizowa³.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //Im wiêcej œwiadków, tym wiêkszy smród. A wtedy sprawa robi siê kosztowniejsza.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Tak wiêc zamierzam wykonaæ swój ruch cichaczem...
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Cipher_WannaJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_WannaJoin_Condition;
	information	= DIA_Cipher_WannaJoin_Info;
	permanent	= FALSE;
	description = "Chcê do³¹czyæ do ludzi Lee!";
};                       

FUNC INT DIA_Cipher_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Chcê do³¹czyæ do ludzi Lee!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //Do ludzi LEE?! Je¿eli bêdzie tak dalej postêpowa³, to ju¿ wkrótce nie bêd¹ jego ludzie.
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Czemu?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee zawsze by³ spokojny. W Kolonii te¿ tak by³o.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Ale ostatnio przesadza. Chce tu po prostu siedzieæ i czekaæ, a¿ paladyni wyzdychaj¹ z g³odu.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio uwa¿a, ¿e powinniœmy wyczyœciæ kilka ma³ych farm poza miastem.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //Myœlê, ¿e to by by³a doskona³a odmiana.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //Teraz wiêkszoœæ z nas zbija b¹ki - i co, chcesz zostaæ jednym z nas?
};

// ************************************************************
// 			  					YesJoin 
// ************************************************************

instance DIA_Cipher_YesJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_YesJoin_Condition;
	information	= DIA_Cipher_YesJoin_Info;
	permanent	= FALSE;
	description = "Tak! Bez wzglêdu na wszystko!";
};                       

FUNC INT DIA_Cipher_YesJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_YesJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Tak! Bez wzglêdu na wszystko!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Wiesz ju¿, ¿e przeprowadzamy g³osowanie w sprawie ka¿dego nowego rekruta?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //Có¿, ju¿ od dawna nie mia³em nic do palenia. Przynieœ mi kilka ³odyg bagiennego ziela, a mój g³os bêdzie twój.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Na pewno gdzieœ mo¿na go trochê zebraæ.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher poprze mnie, jeœli przyniosê mu kilka ³odyg bagiennego ziela.");
};

// ************************************************************
// 			  					Joints 
// ************************************************************

instance DIA_Cipher_Joints (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_Joints_Condition;
	information	= DIA_Cipher_Joints_Info;
	permanent	= TRUE;
	description = "Jeœli chodzi o to bagienne ziele...";
};                       

FUNC INT DIA_Cipher_Joints_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_Joints_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Jeœli chodzi o to bagienne ziele...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Przynios³eœ moj¹ paczkê! Teraz wszystko bêdzie ju¿ w porz¹dku.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Z pewnoœci¹ bêdê na ciebie g³osowa³...
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher poprze mnie, jeœli zechcê siê przy³¹czyæ do najemników.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist glücklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Zobaczê, co da siê zrobiæ...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Mam dla ciebie kilka ³odyg...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Zobaczê, co da siê zrobiæ...
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Mam dla ciebie kilka ³odyg...
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ach! Mój cz³owiek!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Masz mój g³os.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher poprze mnie, jeœli zechcê siê przy³¹czyæ do najemników.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //To wszystko? Tyle wypalê na jedno posiedzenie!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //To musi byæ przynajmniej 10 skrêtów.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //Tak czy inaczej w g³osowaniu o przyjêcie masz mój g³os.
		};
	};

	Info_ClearChoices (DIA_Cipher_Joints);
};


// ************************************************************
// 			  					TRADE
// ************************************************************

instance DIA_Cipher_TRADE (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TRADE_Condition;
	information	= DIA_Cipher_TRADE_Info;
	permanent	= TRUE;
	description = "Poka¿ mi swoje towary.";
	trade		= TRUE;
};                       

FUNC INT DIA_Cipher_TRADE_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TRADE_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Poka¿ mi, co tam masz.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Jasne. Poczêstuj siê.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Nie mam w tej chwili bagiennego ziela. Potrzebujesz czegoœ innego?
	};
};

// ************************************************************
// 			  					Dar Dieb
// ************************************************************

instance DIA_Cipher_DarDieb (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarDieb_Condition;
	information	= DIA_Cipher_DarDieb_Info;
	permanent	= FALSE;
	description = "Wiem, kto zabra³ twoje ziele.";
};                       

FUNC INT DIA_Cipher_DarDieb_Condition()
{
	if ( (Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE) )
	&& (!Npc_IsDead (Dar))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarDieb_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Wiem, kto zabra³ twoje ziele.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Kto? To by³ Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Nie - zrobi³ to jeden z najemników - Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //A to bydlak - gdzie on jest?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Nawet jeœli go znajdziesz, nic ci to nie pomo¿e. Nie ma ju¿ tej paczki. Sprzeda³ j¹ w Khorinis.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //GDZIE ON JEST!?!
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Za kuchni¹, na rogu...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //SKASUJÊ GNOJKA!
	
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Dar, AR_NONE, 0);
};

// ************************************************************
// 			  					Dar LOST
// ************************************************************

instance DIA_Cipher_DarLOST (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarLOST_Condition;
	information	= DIA_Cipher_DarLOST_Info;
	permanent	= FALSE;
	description = "Naprawdê da³eœ Darowi popaliæ... czujesz siê teraz lepiej?";
};                       

FUNC INT DIA_Cipher_DarLOST_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarLOST_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Naprawdê da³eœ Darowi popaliæ... czujesz siê teraz lepiej?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //Taak, to by³o przyjemne.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Chyba nie dla NIEGO...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Ten ma³y ¿ebrak nie ma po co przeszukiwaæ mojej skrzyni!
	
	B_GivePlayerXP ((XP_Ambient)*2);
};

// ************************************************************
// 			  				Kraut PAKET
// ************************************************************

instance DIA_Cipher_KrautPaket (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_KrautPaket_Condition;
	information	= DIA_Cipher_KrautPaket_Info;
	permanent	= FALSE;
	description = "Czy ta paczka bagiennego ziela przypadkiem nie nale¿y do ciebie?";
};                       

FUNC INT DIA_Cipher_KrautPaket_Condition()
{
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_KrautPaket_Info()
{	
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Czy ta paczka bagiennego ziela przypadkiem nie nale¿y do ciebie?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //A niech mnie! Sk¹d to masz?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //To d³uga historia...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //Zreszt¹ niewa¿ne, porz¹dny z ciebie goœæ.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Masz, weŸ to jako nagrodê. Dobrej zabawy!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Najpierw pozwól, ¿e sobie skrêcê...
	CreateInvItems (self, itmi_joint, 40);
	Npc_RemoveInvItems (self, ItMi_HerbPaket, 1);
	
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_CipherPaket);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_CipherSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 900;
	condition	= DIA_CipherSLD_PICKPOCKET_Condition;
	information	= DIA_CipherSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_CipherSLD_PICKPOCKET_Condition()
{
	C_Beklauen (65, 65);
};
 
FUNC VOID DIA_CipherSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_BACK 		,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};


		



		
	
//#####################################################################
//##
//##
//##						Bis - KAPITEL 3 - (danach in OW!)
//##
//##
//#####################################################################
	

	



	
/**/
