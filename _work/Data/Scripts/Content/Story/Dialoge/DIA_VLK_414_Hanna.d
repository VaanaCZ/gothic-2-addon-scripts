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
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Tak to jsi na správném místě.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Jeden z paladinů mi naznačil, že bych tu mohl přespat i zadarmo.
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Kolik stojí noc?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Vůbec nic.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Ubytování poutníků jde na účet paladinům.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Takže tu můžu zůstat zadarmo?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Ano, ano.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Prostě vyjdi po schodech nahoru.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Ještě tam máme dvě postele volné.
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
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Nevím, ale nejspíš v tom bude víc věcí najednou.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Jednak chtějí, aby se po ulici netoulala žádná pochybná sebranka a zbytečně tu nedělala bordel.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //A taky si možná chtějí na svou stranu naklonit potulné kupce.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Teď, když se sedláci bouří, je naše zásobování závislé hlavně na obchodnících.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //A kromě toho bych řekla, že taky chtějí ve městě trochu pozvednout morálku.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre dokonce nařídil, aby na šibeničním náměstí nalévali jedno pivo zdarma.
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
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Ať tě ani nenapadne, že bys jim šel "zkontrolovat" zboží! Nechci tu mít žádné nepříjemnosti!
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
	description	= "Měl bych pár otázek ohledně města...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Měl bych pár otázek ohledně města...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Kde bych si tu mohl něco nakoupit?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Pověz mi něco o městě.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Kde bych si tu mohl něco nakoupit?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Přímo naproti dveřím je tržiště, tam bys měl najít všechno, co potřebuješ.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Na druhé straně města najdeš pár řemeslnických krámků. Většina z nich leží poblíž druhé městské brány.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //V přístavu také můžeš zajít k rybáři. Jeho obchod se nachází přímo v přístavu, najdeš to snadno.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Pověz mi něco o městě.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis je jedním z nejbohatších měst v království, i když teď to tak nevypadá.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Ale od té doby, co začaly ty problémy se skřety, se obchod téměř zastavil. Král totiž naverboval do armády celou kupeckou flotilu.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //To znamená, že do přístavu teď žádné lodi neplují a zásoby zboží se rapidně tenčí. Spousta zdejších obyvatel se proto bojí, co bude dál.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nikdo neví přesně, co nám budoucnost přinese. Vlastně nemůžeme dělat nic jiného, než tu sedět a čekat, co se stane. Nezdá se, že bychom mohli něco změnit.
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
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Nevypadáš, že by tě problémy druhých lidí nějak zvlášť zajímaly.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Ano, jistě, samozřejmě.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"Přijde na to.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Vlastně ne.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Vlastně ne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //Přesně jak říkám. Nikdo tu nemyslí na nic jiného než jenom na sebe. Takže co chceš?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //Přijde na to.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //To jako že přijde na to, co ti z toho kápne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Takové jako ty tu nemůžu vystát.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Jo, jasně.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Co ty víš, svět je plný překvapení. Nedávno jsem dělala pořádek ve zboží a při té příležitosti jsem prodala štůsek map Brahimovi, kartografovi dole v přístavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Bohužel jsem ale vzápětí zjistila, že mi chybí jeden dokument.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Počítám, že se musel nějak přimotat mezi ty papíry.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Nemohl bys mi ho přinést zpátky?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hanně se ztratil nějaký dokument. Nejspíš jí zmizel v přístavu - tam, kde sídlí kartograf Brahim."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nejsem žádný poslíček.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"Co z toho budu mít?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Uvidím, co se dá dělat.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Nejsem žádný poslíček.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Chápu - problémy obyčejné ženy ti nestojí za námahu. No dobře, tak se o to budu muset postarat sama.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //Co z toho budu mít?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Aha, já to věděla - nejsi o nic lepší než ta lůza dole v přístavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Takže co chceš po ubohé ženě?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"To nic.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Taky bys ke mně mohla být trochu vlídnější.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Zlato.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Vlastně nic.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Aspoň že v tobě zbyla trocha slušnosti. Když mi ten dokument přineseš, dostaneš ode mě 75 zlaťáků.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Taky bys ke mně mohla být trochu vlídnější.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //To je ale hnusné! Já... zmiz odsud! Ty nevychovaný hulváte!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Zlato.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Nemůžu ti nabídnout víc než mrzký peníz. No - cením si to na 50 zlaťáků.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Jestli se ti podaří ten dokument získat zpátky, dám ti 50 zlaťáků.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Uvidím, co se dá dělat.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //To je od tebe milé! Hodně štěstí!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Když mi ten dokument přineseš zpátky, odměním se ti.
	
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
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Ano, to je přesně ono. Děkuji ti.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //A co má odměna?
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
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Odkud... jsi to přišel?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //U tebe ve sklepě jsem našel cosi velmi zajímavého.
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //A co jsi dělal u mě ve sklepě?
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //To víš zatraceně dobře!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(chladně) Nemám ponětí, o čem to mluvíš.
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(nedůvěřivě) Jen se na sebe podívej! Odkud jsi to přišel, co?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(rozpačitě) Já...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(usměje se) Já vím!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(spiklenecky) Nemusíš mi nic říkat - vím všechno.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Ať tě ani nenapadne něco tady ukrást, jasné?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Už se nemůžeme hotelu dále věnovat.
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
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Lehmarova účetní kniha. Jak jsi k ní přišel?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //No...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Pokud už ji Lehmar nemá, je to dobrá věc. Stejně bych ji ale radši ukryla u sebe.
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
	description = "Tumáš - klidně si tu knihu vezmi.";
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
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Tumáš - klidně si tu knihu vezmi.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Díky.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Tady máš něco za odměnu.
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
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Je v úkrytu všechno v pořádku?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Už jsem nikoho z nich nějakou dobu neviděla.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Měl bych sejít tam dolů a trochu to tam prošetřit.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Ano, ale radši bys o tom neměl mluvit.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Už jsi zjistil, kde se skrývají zloději?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(domýšlivě) Nemám potuchy, o čem to mluvíš.
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //Vtrhla sem domobrana - někdo vyzradil naši skrýš!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Mně neměli co přišít, ale Cassia je mrtvá a její lidé taky!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Určitě jsi to byl TY.
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Tohle jsem koupila zvlášť pro tebe.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Stálo mě to sice majlant, ale ty si to fakt zasloužíš, ty svině podrazácká.
};	

	
