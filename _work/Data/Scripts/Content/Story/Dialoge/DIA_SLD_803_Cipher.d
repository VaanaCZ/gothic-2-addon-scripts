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
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Jak si� sprawy maj�?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Hej, czy ja ci� sk�d� nie znam?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //To ca�kiem mo�liwe...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //W Kolonii zajmowa�em si� bagiennym zielem, pami�tasz?
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
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //Przynios�em ze sob� z kolonii g�rniczej du�� paczk� bagiennego ziela.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Sporo najemnik�w lubi sobie czasem zapali�, zgromadzi�em wi�c na boku ma�� fortunk�.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Ale jaki� gnojek ukrad� mi ca�y zapas ze skrzyni!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Najemnik Cipher straci� paczk� bagiennego ziela.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Jestem prawie pewien, �e to by� Bodo. �pi w tym samym pokoju co ja i zawsze szczerzy si� do mnie jak idiota...
		B_LogEntry (Topic_CipherPaket, "Podejrzewa, �e ukrad� j� Bodo.");
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
	description = "Co w takim razie zrobisz ze z�odziejem?";
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
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Co w takim razie zrobisz ze z�odziejem?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Pewnego dnia z�api� go, jak b�dzie pali� moje ziele.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //A wtedy znajd� spokojne miejsce i dam mu lekcj�, kt�rej nie zapomni.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Jak spior� go tutaj, na �rodku podw�rka, to zobacz� mnie wie�niacy i nie wyrobi� na grzywny.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //To znaczy?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //To do�� proste. Nie mo�emy gn�bi� ch�op�w, bo Lee ka�e nam za to p�aci� wysokie grzywny. Onar tak to zorganizowa�.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //Im wi�cej �wiadk�w, tym wi�kszy smr�d. A wtedy sprawa robi si� kosztowniejsza.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Tak wi�c zamierzam wykona� sw�j ruch cichaczem...
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
	description = "Chc� do��czy� do ludzi Lee!";
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
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Chc� do��czy� do ludzi Lee!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //Do ludzi LEE?! Je�eli b�dzie tak dalej post�powa�, to ju� wkr�tce nie b�d� jego ludzie.
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Czemu?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee zawsze by� spokojny. W Kolonii te� tak by�o.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Ale ostatnio przesadza. Chce tu po prostu siedzie� i czeka�, a� paladyni wyzdychaj� z g�odu.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio uwa�a, �e powinni�my wyczy�ci� kilka ma�ych farm poza miastem.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //My�l�, �e to by by�a doskona�a odmiana.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //Teraz wi�kszo�� z nas zbija b�ki - i co, chcesz zosta� jednym z nas?
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
	description = "Tak! Bez wzgl�du na wszystko!";
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
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Tak! Bez wzgl�du na wszystko!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Wiesz ju�, �e przeprowadzamy g�osowanie w sprawie ka�dego nowego rekruta?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //C�, ju� od dawna nie mia�em nic do palenia. Przynie� mi kilka �odyg bagiennego ziela, a m�j g�os b�dzie tw�j.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Na pewno gdzie� mo�na go troch� zebra�.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher poprze mnie, je�li przynios� mu kilka �odyg bagiennego ziela.");
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
	description = "Je�li chodzi o to bagienne ziele...";
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
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Je�li chodzi o to bagienne ziele...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Przynios�e� moj� paczk�! Teraz wszystko b�dzie ju� w porz�dku.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Z pewno�ci� b�d� na ciebie g�osowa�...
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher poprze mnie, je�li zechc� si� przy��czy� do najemnik�w.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist gl�cklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Zobacz�, co da si� zrobi�...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Mam dla ciebie kilka �odyg...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Zobacz�, co da si� zrobi�...
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Mam dla ciebie kilka �odyg...
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ach! M�j cz�owiek!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Masz m�j g�os.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher poprze mnie, je�li zechc� si� przy��czy� do najemnik�w.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //To wszystko? Tyle wypal� na jedno posiedzenie!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //To musi by� przynajmniej 10 skr�t�w.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //Tak czy inaczej w g�osowaniu o przyj�cie masz m�j g�os.
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
	description = "Poka� mi swoje towary.";
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
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Poka� mi, co tam masz.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Jasne. Pocz�stuj si�.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Nie mam w tej chwili bagiennego ziela. Potrzebujesz czego� innego?
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
	description = "Wiem, kto zabra� twoje ziele.";
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
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Wiem, kto zabra� twoje ziele.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Kto? To by� Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Nie - zrobi� to jeden z najemnik�w - Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //A to bydlak - gdzie on jest?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Nawet je�li go znajdziesz, nic ci to nie pomo�e. Nie ma ju� tej paczki. Sprzeda� j� w Khorinis.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //GDZIE ON JEST!?!
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Za kuchni�, na rogu...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //SKASUJ� GNOJKA!
	
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
	description = "Naprawd� da�e� Darowi popali�... czujesz si� teraz lepiej?";
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
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Naprawd� da�e� Darowi popali�... czujesz si� teraz lepiej?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //Taak, to by�o przyjemne.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Chyba nie dla NIEGO...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Ten ma�y �ebrak nie ma po co przeszukiwa� mojej skrzyni!
	
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
	description = "Czy ta paczka bagiennego ziela przypadkiem nie nale�y do ciebie?";
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
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Czy ta paczka bagiennego ziela przypadkiem nie nale�y do ciebie?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //A niech mnie! Sk�d to masz?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //To d�uga historia...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //Zreszt� niewa�ne, porz�dny z ciebie go��.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Masz, we� to jako nagrod�. Dobrej zabawy!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Najpierw pozw�l, �e sobie skr�c�...
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
