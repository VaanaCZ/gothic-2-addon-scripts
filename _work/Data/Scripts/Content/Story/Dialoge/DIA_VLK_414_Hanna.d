// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Á, zákazník - čímpak posloužím?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Hledám pokoj.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Hledám pokoj.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Tak to jsi na správném místę.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Jeden z paladinů mi naznačil, že bych tu mohl pâespat i zadarmo.
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Kolik stojí noc?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Vůbec nic.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Ubytování poutníků jde na účet paladinům.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Takže tu můžu zůstat zadarmo?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Ano, ano.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Prostę vyjdi po schodech nahoru.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Ještę tam máme dvę postele volné.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Proč paladinové za všechno platí?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Proč paladinové za všechno platí?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Nevím, ale nejspíš v tom bude víc vęcí najednou.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Jednak chtęjí, aby se po ulici netoulala žádná pochybná sebranka a zbytečnę tu nedęlala bordel.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //A taky si možná chtęjí na svou stranu naklonit potulné kupce.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Teë, když se sedláci bouâí, je naše zásobování závislé hlavnę na obchodnících.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //A kromę toho bych âekla, že taky chtęjí ve męstę trochu pozvednout morálku.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre dokonce naâídil, aby na šibeničním námęstí nalévali jedno pivo zdarma.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Kdo tady zrovna je?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Kdo tady zrovna je?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Skoro všechno jsou potulní trhovci.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Aă tę ani nenapadne, že bys jim šel "zkontrolovat" zboží! Nechci tu mít žádné nepâíjemnosti!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "Męl bych pár otázek ohlednę męsta...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Męl bych pár otázek ohlednę męsta...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Kde bych si tu mohl nęco nakoupit?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Povęz mi nęco o męstę.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Kde bych si tu mohl nęco nakoupit?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Pâímo naproti dveâím je tržištę, tam bys męl najít všechno, co potâebuješ.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Na druhé stranę męsta najdeš pár âemeslnických krámků. Vętšina z nich leží poblíž druhé męstské brány.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //V pâístavu také můžeš zajít k rybáâi. Jeho obchod se nachází pâímo v pâístavu, najdeš to snadno.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Povęz mi nęco o męstę.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis je jedním z nejbohatších męst v království, i když teë to tak nevypadá.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Ale od té doby, co začaly ty problémy se skâety, se obchod témęâ zastavil. Král totiž naverboval do armády celou kupeckou flotilu.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //To znamená, že do pâístavu teë žádné lodi neplují a zásoby zboží se rapidnę tenčí. Spousta zdejších obyvatel se proto bojí, co bude dál.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nikdo neví pâesnę, co nám budoucnost pâinese. Vlastnę nemůžeme dęlat nic jiného, než tu sedęt a čekat, co se stane. Nezdá se, že bychom mohli nęco zmęnit.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Jak to jde?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Nevypadáš, že by tę problémy druhých lidí nęjak zvlášă zajímaly.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Ano, jistę, samozâejmę.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"Pâijde na to.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Vlastnę ne.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Vlastnę ne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //Pâesnę jak âíkám. Nikdo tu nemyslí na nic jiného než jenom na sebe. Takže co chceš?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //Pâijde na to.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //To jako že pâijde na to, co ti z toho kápne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Takové jako ty tu nemůžu vystát.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Jo, jasnę.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Co ty víš, svęt je plný pâekvapení. Nedávno jsem dęlala poâádek ve zboží a pâi té pâíležitosti jsem prodala štůsek map Brahimovi, kartografovi dole v pâístavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Bohužel jsem ale vzápętí zjistila, že mi chybí jeden dokument.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Počítám, že se musel nęjak pâimotat mezi ty papíry.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Nemohl bys mi ho pâinést zpátky?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hannę se ztratil nęjaký dokument. Nejspíš jí zmizel v pâístavu - tam, kde sídlí kartograf Brahim."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nejsem žádný poslíček.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"Co z toho budu mít?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Uvidím, co se dá dęlat.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Nejsem žádný poslíček.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Chápu - problémy obyčejné ženy ti nestojí za námahu. No dobâe, tak se o to budu muset postarat sama.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //Co z toho budu mít?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Aha, já to vędęla - nejsi o nic lepší než ta lůza dole v pâístavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Takže co chceš po ubohé ženę?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"To nic.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Taky bys ke mnę mohla být trochu vlídnęjší.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Zlato.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Vlastnę nic.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Aspoŕ že v tobę zbyla trocha slušnosti. Když mi ten dokument pâineseš, dostaneš ode mę 75 zlaăáků.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Taky bys ke mnę mohla být trochu vlídnęjší.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //To je ale hnusné! Já... zmiz odsud! Ty nevychovaný hulváte!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Zlato.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Nemůžu ti nabídnout víc než mrzký peníz. No - cením si to na 50 zlaăáků.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Jestli se ti podaâí ten dokument získat zpátky, dám ti 50 zlaăáků.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Uvidím, co se dá dęlat.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //To je od tebe milé! Hodnę štęstí!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Když mi ten dokument pâineseš zpátky, odmęním se ti.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Myslelas tenhle dokument?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Myslelas tenhle dokument?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Ano, to je pâesnę ono. Dękuji ti.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //A co má odmęna?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Ne tak zhurta. Tady máš peníze.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Odkud... jsi to pâišel?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //U tebe ve sklepę jsem našel cosi velmi zajímavého.
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //A co jsi dęlal u mę ve sklepę?
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //To víš zatracenę dobâe!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(chladnę) Nemám ponętí, o čem to mluvíš.
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(nedůvęâivę) Jen se na sebe podívej! Odkud jsi to pâišel, co?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(rozpačitę) Já...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(usmęje se) Já vím!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(spiklenecky) Nemusíš mi nic âíkat - vím všechno.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Aă tę ani nenapadne nęco tady ukrást, jasné?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Už se nemůžeme hotelu dále vęnovat.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Podívej, jakou knihu tu mám!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Podívej, jakou knihu tu mám!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Lehmarova účetní kniha. Jak jsi k ní pâišel?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //No...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Pokud už ji Lehmar nemá, je to dobrá vęc. Stejnę bych ji ale radši ukryla u sebe.
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Tumáš - klidnę si tu knihu vezmi.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Tumáš - klidnę si tu knihu vezmi.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Díky.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Tady máš nęco za odmęnu.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Co jsi mi to dala?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //Je to klíč od brány bohatství.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Je v úkrytu všechno v poâádku?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Už jsem nikoho z nich nęjakou dobu nevidęla.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Męl bych sejít tam dolů a trochu to tam prošetâit.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Ano, ale radši bys o tom nemęl mluvit.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Už jsi zjistil, kde se skrývají zlodęji?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(domýšlivę) Nemám potuchy, o čem to mluvíš.
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //Vtrhla sem domobrana - nękdo vyzradil naši skrýš!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Mnę nemęli co pâišít, ale Cassia je mrtvá a její lidé taky!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Určitę jsi to byl TY.
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Tohle jsem koupila zvlášă pro tebe.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Stálo mę to sice majlant, ale ty si to fakt zasloužíš, ty svinę podrazácká.
};	

	
