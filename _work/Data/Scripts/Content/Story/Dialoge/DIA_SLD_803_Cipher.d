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
	description = "Jak to jde?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Jak se vede?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Hej, nezn�m t� odn�kud?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //Je to mo�n�...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //Pokou�el jsem se v kolonii obchodovat s tr�vou z ba�in, vzpom�n�?
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
	description = "A s ��mpak obchoduje� nyn�?";
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
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //A s ��mpak obchoduje� te�?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ani se neptej.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //P�inesl jsem si s sebou z hornick� kolonie cel� pytl�k t�hle tr�vy.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Hodn� �old�k� dostane tu a tam chu� si trochu zakou�it. Vyd�lal jsem si takhle bokem trochu pen�z.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Ale n�jak� bastard mi ukradl z truhly v�echnu tr�vu!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "�oldn��i Cipherovi se ztratil bal�k tr�vy z ba�in.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Jsem si docela jistej, �e to byl Bodo. Ob�v� stejnou m�stnost jako j� a v�dycky se na m� k�en� jako n�jakej idiot.
		B_LogEntry (Topic_CipherPaket, "Domn�v� se, �e zlod�jem je Bodo.");
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
	description = "Co tedy hodl� s t�m zlod�jem ud�lat?";
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
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Co tedy chce� s t�m zlod�jem ud�lat?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Jednou ho ur�it� nachyt�m, jak bude kou�it moj� tr�vu.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //A pak si najdu n�jak� odlehl� m�sto a d�m mu takovou lekci, na kterou do smrti nezapomene.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Kdybych ho napadnul tady uprost�ed dvora, ostatn� by si toho v�imli a j� bych si to odsk�kal.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //Jak to?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //To je jednoduch�. Nem��eme zml�tit farm��e, jinak bychom Leeovi zaplatili pokutu. Takhle to chce Onar.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //A ��m v�ce sv�dk� u toho je, t�m v�ce poprasku kolem toho bude. A to by se n�m prodra�ilo.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Tak�e tu v�c vy��d�m hezky nen�padn�.
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
	description = "Chci se p�idat k Leeov�m lidem!";
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
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Chci se p�idat k Leeov�m lidem!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //Leeov�m lidem?! Jestli Lee bude pokra�ovat t�mhle zp�sobem, tak u� brzy jeho nebudou!
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Pro�?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee byl v�dycky kli�as. To byl v kolonii taky.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Ale posledn� dobou to u� p�eh�n�. Chce si sem prost� jen tak sednout a �ekat, dokud paladinov� neum�ou hlady.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio si mysl�, �e bychom m�li trochu vy�istit mal� farmy a okol� m�sta.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //Mysl�m, �e by se m�l co nejd��ve �pln� zm�nit.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //V t�hle chv�li tu v�t�ina z n�s sed� s rukama v kl�n� - i tak se chce� k n�m po��d p�idat?
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
	description = "Chci se st�t jedn�m z v�s a je mi jedno jak!";
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
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Chci se st�t jedn�m z v�s a je mi jedno jak!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //U� v�, �e mus�me nechat o ka�d�m nov�m rekrutovi hlasovat?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Na co nar��?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //No, u� jsem hodn� dlouho nic nekou�il. P�ines mi trochu tr�vy z ba�in a dostane� m�j hlas.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Jist� se ti poda�� n�jakou spla�it.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher se za m� zaru��, pokud mu p�inesu n�jakou tr�vu z ba�in.");
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
	description = "Co se t��e tr�vy z ba�in...";
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
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Co se t��e tr�vy z ba�in...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //P�inesl jsi mi zp�tky m�j bal��ek tr�vy! Te� bude v�echno v po��dku.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Samoz�ejm� budu hlasovat pro tebe.
			
			B_LogEntry (TOPIC_SLDRespekt,"Kdy� se budu cht�t p�idat k �oldn���m, Cipher se za m� p�imluv�.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist gl�cklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Uvid�m, co se d� d�lat...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Tady m� p�r st�bel...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Uvid�m, co se d� d�lat...
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Tady m� p�r st�bel.
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ach! Ty jsi m�j �lov�k!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //M� m�j hlas.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Kdy� se budu cht�t p�idat k �oldn���m, Cipher se za m� p�imluv�.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //To je v�echno? Tohle vykou��m na jeden z�tah!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //To je nejm�n� na deset �pek�.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //V ka�d�m p��pad� m� m�j hlas, aby ses k n�m p�idal.
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
	description = "Uka� mi sv� zbo��.";
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
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Uka� mi sv� zbo��.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Jist�. Jak je libo.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //V t�hle chv�li nem�m ��dnou tr�vu. Nechce� n�co jin�ho?
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
	description = "V�m, kdo ti sebral tvoj� tr�vu.";
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
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //V�m, kdo ti sebral tu tr�vu.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Kdo? Byl to Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Ne - ud�lal to jeden z �old�k�. Jmenuje se Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //Ten parchant - kde je?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //T�m, �e ho najde�, si nepom��e�. U� nem� ten bal��ek u sebe. Prodal ho v Khorinidu.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //KDE JE!?!
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Za tou budovou s kuchyn�, na rohu.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //J� SI TO S N�M VY��D�M!
	
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
	description = "V�n� jsi dal Darovi co proto... c�t� se te� l�p?";
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
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Skute�n� jsi dal Darovi co proto. C�t� se te� l�p?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //(povzdech) Joo, c�t�m se fajn.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //P�edpokl�d�m, �e ON ne...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Ten malej �ebr�k se nem� co �trachat v moj� truhle!
	
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
	description = "Nen� tenhle bal��ek tr�vy n�hodou tv�j?";
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
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Nen� tenhle bal��ek tr�vy n�hodou tv�j?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //No, jasn�! Kde jsi ho sebral?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //To je dlouh� p��b�h...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //To nevad�, opravdu jsi slu�nej chlap�k.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Tady, vezmi si tohle jako odm�nu. U�ij si to!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Te� m� nech trochu pracovat...
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
