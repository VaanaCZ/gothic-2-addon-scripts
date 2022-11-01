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
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Jak się sprawy mają?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Hej, czy ja cię skądś nie znam?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //To całkiem możliwe...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //W Kolonii zajmowałem się bagiennym zielem, pamiętasz?
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
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //Przyniosłem ze sobą z kolonii górniczej dużą paczkę bagiennego ziela.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Sporo najemników lubi sobie czasem zapalić, zgromadziłem więc na boku małą fortunkę.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Ale jakiś gnojek ukradł mi cały zapas ze skrzyni!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Najemnik Cipher stracił paczkę bagiennego ziela.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Jestem prawie pewien, że to był Bodo. Śpi w tym samym pokoju co ja i zawsze szczerzy się do mnie jak idiota...
		B_LogEntry (Topic_CipherPaket, "Podejrzewa, że ukradł ją Bodo.");
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
	description = "Co w takim razie zrobisz ze złodziejem?";
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
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Co w takim razie zrobisz ze złodziejem?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Pewnego dnia złapię go, jak będzie palił moje ziele.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //A wtedy znajdę spokojne miejsce i dam mu lekcję, której nie zapomni.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Jak spiorę go tutaj, na środku podwórka, to zobaczą mnie wieśniacy i nie wyrobię na grzywny.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //To znaczy?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //To dość proste. Nie możemy gnębić chłopów, bo Lee każe nam za to płacić wysokie grzywny. Onar tak to zorganizował.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //Im więcej świadków, tym większy smród. A wtedy sprawa robi się kosztowniejsza.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Tak więc zamierzam wykonać swój ruch cichaczem...
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
	description = "Chcę dołączyć do ludzi Lee!";
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
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Chcę dołączyć do ludzi Lee!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //Do ludzi LEE?! Jeżeli będzie tak dalej postępował, to już wkrótce nie będą jego ludzie.
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Czemu?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee zawsze był spokojny. W Kolonii też tak było.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Ale ostatnio przesadza. Chce tu po prostu siedzieć i czekać, aż paladyni wyzdychają z głodu.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio uważa, że powinniśmy wyczyścić kilka małych farm poza miastem.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //Myślę, że to by była doskonała odmiana.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //Teraz większość z nas zbija bąki - i co, chcesz zostać jednym z nas?
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
	description = "Tak! Bez względu na wszystko!";
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
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Tak! Bez względu na wszystko!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Wiesz już, że przeprowadzamy głosowanie w sprawie każdego nowego rekruta?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //Cóż, już od dawna nie miałem nic do palenia. Przynieś mi kilka łodyg bagiennego ziela, a mój głos będzie twój.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Na pewno gdzieś można go trochę zebrać.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher poprze mnie, jeśli przyniosę mu kilka łodyg bagiennego ziela.");
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
	description = "Jeśli chodzi o to bagienne ziele...";
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
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Jeśli chodzi o to bagienne ziele...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Przyniosłeś moją paczkę! Teraz wszystko będzie już w porządku.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Z pewnością będę na ciebie głosował...
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher poprze mnie, jeśli zechcę się przyłączyć do najemników.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist glücklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Zobaczę, co da się zrobić...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Mam dla ciebie kilka łodyg...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Zobaczę, co da się zrobić...
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Mam dla ciebie kilka łodyg...
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ach! Mój człowiek!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Masz mój głos.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher poprze mnie, jeśli zechcę się przyłączyć do najemników.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //To wszystko? Tyle wypalę na jedno posiedzenie!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //To musi być przynajmniej 10 skrętów.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //Tak czy inaczej w głosowaniu o przyjęcie masz mój głos.
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
	description = "Pokaż mi swoje towary.";
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
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Pokaż mi, co tam masz.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Jasne. Poczęstuj się.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Nie mam w tej chwili bagiennego ziela. Potrzebujesz czegoś innego?
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
	description = "Wiem, kto zabrał twoje ziele.";
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
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Wiem, kto zabrał twoje ziele.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Kto? To był Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Nie - zrobił to jeden z najemników - Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //A to bydlak - gdzie on jest?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Nawet jeśli go znajdziesz, nic ci to nie pomoże. Nie ma już tej paczki. Sprzedał ją w Khorinis.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //GDZIE ON JEST!?!
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Za kuchnią, na rogu...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //SKASUJĘ GNOJKA!
	
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
	description = "Naprawdę dałeś Darowi popalić... czujesz się teraz lepiej?";
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
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Naprawdę dałeś Darowi popalić... czujesz się teraz lepiej?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //Taak, to było przyjemne.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Chyba nie dla NIEGO...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Ten mały żebrak nie ma po co przeszukiwać mojej skrzyni!
	
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
	description = "Czy ta paczka bagiennego ziela przypadkiem nie należy do ciebie?";
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
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Czy ta paczka bagiennego ziela przypadkiem nie należy do ciebie?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //A niech mnie! Skąd to masz?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //To długa historia...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //Zresztą nieważne, porządny z ciebie gość.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Masz, weź to jako nagrodę. Dobrej zabawy!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Najpierw pozwól, że sobie skręcę...
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
