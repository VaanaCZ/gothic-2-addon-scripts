///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Hej, nowy w mieœcie, co?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Tak, ale co ci do tego?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //Niedawno przyby³em z kontynentu, teraz w³óczê siê bez celu. Z³oto niemal mi siê skoñczy³o, nie pozostanie mi wiêc chyba nic innego, jak tylko przy³¹czyæ siê do stra¿y.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Nie chcê tego jednak. To ¿adna przyjemnoœæ zostaæ rozszarpanym przez orków, w imiê Króla.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"Co mo¿esz mi powiedzieæ na temat stra¿y?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Co mo¿esz mi powiedzieæ na temat stra¿y?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Jeden z paladynów przej¹³ niedawno dowodzenie. Niejaki Lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Próbuje zmobilizowaæ po³owê miasta do walki przeciwko orkom.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Jednak, ¿eby siê zaci¹gn¹æ, trzeba byæ obywatelem miasta.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Z tego co wiem, to nie bêd¹c obywatelem, mo¿na trenowaæ, nie zostanie siê jednak oficjalnie przyjêtym.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"Co jeszcze mo¿esz mi powiedzieæ o Lordzie Andre?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Co jeszcze mo¿esz mi powiedzieæ o Lordzie Andre?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Wiem, ¿e obj¹³ tak¿e funkcjê sêdziego.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Jeœli wdasz siê w jakieœ k³opoty w mieœcie, bêdziesz musia³ przed nim odpowiadaæ.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Zdarzy³o mi siê raz wdaæ w bójkê z jednym z obywateli.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //Ten pobieg³ z p³aczem do Lorda Andre i doniós³ na mnie.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Ta drobnostka kosztowa³a mnie 50 sztuk z³ota.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Ca³e szczêœcie, ¿e zajœcie mia³o miejsce w nocy i nie by³o œwiadków.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Im wiêcej osób naskar¿y na ciebie w³adzom, tym wy¿sz¹ karê dostaniesz.
};

// ****************************************************
// 					Prügelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Z kim siê pobi³eœ?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //Z kim siê pobi³eœ?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Koleœ nazywa siê Valentino. Czêsto przesiaduje w knajpie, w pobli¿u œwi¹tyni.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //Na ogó³, nie uznajê przemocy. Ale TEN cz³owiek zas³u¿y³ na to, ¿eby przerobiæ mu trochê facjatê.
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"Pozna³em Valentina.";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Pozna³em Valentina.
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //I?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Sprawi³em mu têgie lanie...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //Zas³ugiwa³ na to...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Podczas naszej ma³ej sprzeczki znalaz³em przy nim ten pierœcieñ.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //Mo¿esz go przekazaæ nastêpnej osobie, która da mu w mordê...
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Czy ostatnio wydarzy³o siê coœ ciekawego?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Czy ostatnio wydarzy³o siê coœ ciekawego?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Mo¿na by tak powiedzieæ.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Okradziono Bospera, miejscowego ³uczarza. Co za tupet.
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Koleœ po prostu wszed³ do sklepu, w œrodku dnia, i zabra³ stamt¹d ³uk.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //Bosper wyskoczy³ za nim jak poparzony, krzycz¹c: 'Stój, zatrzymaj siê, draniu!' Z³odziej jednak by³ szybszy.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Ostatnio jakiœ uczciwy znalazca odniós³ ³uk Bosperowi.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //To dziwne, mog³oby siê wydawaæ, ¿e ka¿dy chce dla siebie jak najwiêcej, a ten koleœ po prostu wraca i oddaje ³uk.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Có¿, wszystko po staremu. Jeœli zaatakuj¹ nas orkowie, na pewno to zauwa¿ymy...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Okaza³o siê, ¿e najemnik by³ niewinny. Z tego co wiem, wypuszczono go na wolnoœæ.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen musi byæ zielony ze z³oœci.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Ca³e miasto jest rozsierdzone. Pamiêtasz paladyna Lothara?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Byæ mo¿e.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Tak czy inaczej, nie ¿yje. Jak zwykle, obwiniaj¹ najemników.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Szukam za³ogi, która wyruszy³aby ze mn¹ na morze.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Szukam za³ogi, która wyruszy³aby ze mn¹ na morze.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //W tej kwestii nie mogê ci pomóc. Powinieneœ poszukaæ kogoœ w okolicach portu, mo¿e w okolicznych knajpach.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Jeœli w mieœcie s¹ jeszcze jacyœ ¿eglarze, to pewnie tam w³aœnie ich znajdziesz.

};


