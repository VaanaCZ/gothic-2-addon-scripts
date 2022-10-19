
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

	description	 = 	"Co se d�je?";
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
	AI_Output			(other, self, "DIA_BullcoDJG_HALLO_15_00"); //Co se d�je??
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_01"); //Je tady zatracen� zima, chlape! Pro� Sylvio trval na tom, abysme �li zrovna sem?
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_02"); //Existuje spousta jinejch m�st, co stojej alespo� za n�co!
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

	description	 = 	"A co jinak. V�echno v po��dku?";
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
	AI_Output			(other, self, "DIA_BullcoDJG_WARTEMAL_15_00"); //A co jinak. V�echno v po��dku?

	if (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_01"); //Prost� mi p�esta� l�zt na nervy.
		}
	else
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_02"); //Te� ne! Mrznu! Jedin�, co chci, je odsud vypadnout, jak nejrychlej� to p�jde.
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
	AI_Output			(self, other, "DIA_Bullco_SYLVIODEAD_06_00"); //�ert aby to spral. Sylvio je mrtvej.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Za��t");
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

	description	 = 	"Co pl�nuje� te�, kdy� je Sylvio mrtv�?";
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
	AI_Output			(other, self, "DIA_Bullco_WASNUN_15_00"); //Co te�, kdy� je Sylvio mrtvej?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_06_01"); //Nem�m tu�en�. H�d�m, �e p�jdu d�l s ostatn�ma drakobijcema. Pokud teda o m� je�t� budou st�t.

	Info_AddChoice	(DIA_Bullco_WASNUN, "M�l bych ti utrhnout hlavu.", DIA_Bullco_WASNUN_kopfab );
	Info_AddChoice	(DIA_Bullco_WASNUN, "V�, kde jsou ostatn�?", DIA_Bullco_WASNUN_woandere );

};

func void DIA_Bullco_WASNUN_woandere ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_15_00"); //V�, kde jsou ostatn�?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_06_01"); //Mysl�m, �e jo. Alespo� jsem jednoho z nich vid�l tam na �ece.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Vezmi m� k lovc�m drak�.", DIA_Bullco_WASNUN_woandere_zuihnen );
};
func void DIA_Bullco_WASNUN_woandere_zuihnen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_15_00"); //Vezmi m� k ostatn�m drakobijc�m.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_06_01"); //Hele, j� nejsem tv�j sluha.

	Info_ClearChoices	(DIA_Bullco_WASNUN);

	Info_AddChoice	(DIA_Bullco_WASNUN, "Jen si poslu�, j� je ur�it� najdu.", DIA_Bullco_WASNUN_woandere_zuihnen_alleine );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Pova�uj se za sluhu a j� t� nech�m na�ivu.", DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen );
	Info_AddChoice	(DIA_Bullco_WASNUN, "D�m ti za to 50 zlat�ch.", DIA_Bullco_WASNUN_woandere_zuihnen_Geld );


};
func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00"); //Pova�uj se za sluhu a j� t� nech�m na�ivu.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01"); //Nech m� na pokoji.
	AI_StopProcessInfos (self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00"); //D�m ti za to 50 zlat�ch.
	
	if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01"); //Tak dobr�. Naval prachy.
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02"); //Poj� za mnou. Vezmu t� na m�sto, kde jsem naposledy spat�il ostatn� drakobijce.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"DJGVorposten");
		}
		else
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03"); //Nem� 50 zlat�ch a j� se do takov�ho pr�seru prost� jen tak nepo�enu. Ztra� se.
			AI_StopProcessInfos (self);
		};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00"); //Jak je libo. Jsem si jistej, �e ho najdu.
	AI_Output			(self ,other, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01"); //V tom p��pad� ��dn� vytr�cen�.
	
	AI_StopProcessInfos (self);
};


func void DIA_Bullco_WASNUN_kopfab ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_15_00"); //M�l bych ti utrhnout hlavu.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_06_01"); //Sklapni u� tu svoj� velkou hubu.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Do zbran�. Skon��me to hned.", DIA_Bullco_WASNUN_kopfab_angriff );


};
func void DIA_Bullco_WASNUN_kopfab_angriff ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_angriff_15_00"); //Do zbran�. Skon��me to hned.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_angriff_06_01"); //Jak si p�eje�.

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






