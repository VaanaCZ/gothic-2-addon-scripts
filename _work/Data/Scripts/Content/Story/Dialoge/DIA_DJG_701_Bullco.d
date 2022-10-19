
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BullcoDJG_EXIT   (C_INFO)
{
	npc         = DJG_701_Bullco;
	nr          = 999;
	condition   = DIA_BullcoDJG_EXIT_Condition;
	information = DIA_BullcoDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////

instance DIA_BullcoDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 5;
	condition	 = 	DIA_BullcoDJG_HALLO_Condition;
	information	 = 	DIA_BullcoDJG_HALLO_Info;

	description	 = 	"Co se dêje?";
};

func int DIA_BullcoDJG_HALLO_Condition ()
{
	if ((Npc_IsDead(DJG_Sylvio))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_HALLO_15_00"); //Co se dêje??
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_01"); //Je tady zatracená zima, chlape! Proè Sylvio trval na tom, abysme šli zrovna sem?
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_02"); //Existuje spousta jinejch míst, co stojej alespoà za nêco!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wartemal
///////////////////////////////////////////////////////////////////////
instance DIA_BullcoDJG_WARTEMAL		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 6;
	condition	 = 	DIA_BullcoDJG_WARTEMAL_Condition;
	information	 = 	DIA_BullcoDJG_WARTEMAL_Info;

	permanent	 = 	TRUE;

	description	 = 	"A co jinak. Všechno v poâádku?";
};

func int DIA_BullcoDJG_WARTEMAL_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_BullcoDJG_HALLO))
		|| (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_WARTEMAL_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_WARTEMAL_15_00"); //A co jinak. Všechno v poâádku?

	if (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_01"); //Prostê mi pâestaà lézt na nervy.
		}
	else
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_02"); //Teë ne! Mrznu! Jediný, co chci, je odsud vypadnout, jak nejrychlejš to pùjde.
		};

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info SylvioDead
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_SYLVIODEAD		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		 = 	7;
	condition	 = 	DIA_Bullco_SYLVIODEAD_Condition;
	information	 = 	DIA_Bullco_SYLVIODEAD_Info;
	important	 = 	TRUE;
};

func int DIA_Bullco_SYLVIODEAD_Condition ()
{
	if (Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_SYLVIODEAD_Info ()
{
	AI_Output			(self, other, "DIA_Bullco_SYLVIODEAD_06_00"); //Èert aby to spral. Sylvio je mrtvej.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít");
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_WASNUN		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr		 = 	8;
	condition	 = 	DIA_Bullco_WASNUN_Condition;
	information	 = 	DIA_Bullco_WASNUN_Info;

	description	 = 	"Co plánuješ teë, když je Sylvio mrtvý?";
};

func int DIA_Bullco_WASNUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bullco_SYLVIODEAD))
		&&(Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_15_00"); //Co teë, když je Sylvio mrtvej?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_06_01"); //Nemám tušení. Hádám, že pùjdu dál s ostatníma drakobijcema. Pokud teda o mê ještê budou stát.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Mêl bych ti utrhnout hlavu.", DIA_Bullco_WASNUN_kopfab );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Víš, kde jsou ostatní?", DIA_Bullco_WASNUN_woandere );

};

func void DIA_Bullco_WASNUN_woandere ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_15_00"); //Víš, kde jsou ostatní?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_06_01"); //Myslím, že jo. Alespoà jsem jednoho z nich vidêl tam na âece.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Vezmi mê k lovcùm drakù.", DIA_Bullco_WASNUN_woandere_zuihnen );
};
func void DIA_Bullco_WASNUN_woandere_zuihnen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_15_00"); //Vezmi mê k ostatním drakobijcùm.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_06_01"); //Hele, já nejsem tvùj sluha.

	Info_ClearChoices	(DIA_Bullco_WASNUN);

	Info_AddChoice	(DIA_Bullco_WASNUN, "Jen si posluž, já je urèitê najdu.", DIA_Bullco_WASNUN_woandere_zuihnen_alleine );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Považuj se za sluhu a já tê nechám naživu.", DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Dám ti za to 50 zlatých.", DIA_Bullco_WASNUN_woandere_zuihnen_Geld );


};
func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00"); //Považuj se za sluhu a já tê nechám naživu.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01"); //Nech mê na pokoji.
	AI_StopProcessInfos (self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00"); //Dám ti za to 50 zlatých.
	
	if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01"); //Tak dobrá. Naval prachy.
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02"); //Pojë za mnou. Vezmu tê na místo, kde jsem naposledy spatâil ostatní drakobijce.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"DJGVorposten");
		}
		else
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03"); //Nemáš 50 zlatých a já se do takovýho prùseru prostê jen tak nepoženu. Ztraã se.
			AI_StopProcessInfos (self);
		};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00"); //Jak je libo. Jsem si jistej, že ho najdu.
	AI_Output			(self ,other, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01"); //V tom pâípadê žádný vytrácení.
	
	AI_StopProcessInfos (self);
};


func void DIA_Bullco_WASNUN_kopfab ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_15_00"); //Mêl bych ti utrhnout hlavu.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_06_01"); //Sklapni už tu svojí velkou hubu.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Do zbranê. Skonèíme to hned.", DIA_Bullco_WASNUN_kopfab_angriff );


};
func void DIA_Bullco_WASNUN_kopfab_angriff ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_angriff_15_00"); //Do zbranê. Skonèíme to hned.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_angriff_06_01"); //Jak si pâeješ.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bullco_PICKPOCKET (C_INFO)
{
	npc			= DJG_701_Bullco;
	nr			= 900;
	condition	= DIA_Bullco_PICKPOCKET_Condition;
	information	= DIA_Bullco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bullco_PICKPOCKET_Condition()
{
	C_Beklauen (34, 65);
};
 
FUNC VOID DIA_Bullco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bullco_PICKPOCKET);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_BACK 		,DIA_Bullco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bullco_PICKPOCKET_DoIt);
};

func void DIA_Bullco_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};
	
func void DIA_Bullco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};






