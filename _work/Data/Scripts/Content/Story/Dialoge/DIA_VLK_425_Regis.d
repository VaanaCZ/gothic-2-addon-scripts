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
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Hej, nowy w mie�cie, co?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Tak, ale co ci do tego?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //Niedawno przyby�em z kontynentu, teraz w��cz� si� bez celu. Z�oto niemal mi si� sko�czy�o, nie pozostanie mi wi�c chyba nic innego, jak tylko przy��czy� si� do stra�y.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Nie chc� tego jednak. To �adna przyjemno�� zosta� rozszarpanym przez ork�w, w imi� Kr�la.
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
	description	 = 	"Co mo�esz mi powiedzie� na temat stra�y?";
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
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Co mo�esz mi powiedzie� na temat stra�y?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Jeden z paladyn�w przej�� niedawno dowodzenie. Niejaki Lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Pr�buje zmobilizowa� po�ow� miasta do walki przeciwko orkom.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Jednak, �eby si� zaci�gn��, trzeba by� obywatelem miasta.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Z tego co wiem, to nie b�d�c obywatelem, mo�na trenowa�, nie zostanie si� jednak oficjalnie przyj�tym.
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
	description	 = 	"Co jeszcze mo�esz mi powiedzie� o Lordzie Andre?";
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
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Co jeszcze mo�esz mi powiedzie� o Lordzie Andre?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Wiem, �e obj�� tak�e funkcj� s�dziego.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Je�li wdasz si� w jakie� k�opoty w mie�cie, b�dziesz musia� przed nim odpowiada�.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Zdarzy�o mi si� raz wda� w b�jk� z jednym z obywateli.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //Ten pobieg� z p�aczem do Lorda Andre i doni�s� na mnie.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Ta drobnostka kosztowa�a mnie 50 sztuk z�ota.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Ca�e szcz�cie, �e zaj�cie mia�o miejsce w nocy i nie by�o �wiadk�w.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Im wi�cej os�b naskar�y na ciebie w�adzom, tym wy�sz� kar� dostaniesz.
};

// ****************************************************
// 					Pr�gelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Z kim si� pobi�e�?";
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
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //Z kim si� pobi�e�?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Kole� nazywa si� Valentino. Cz�sto przesiaduje w knajpie, w pobli�u �wi�tyni.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //Na og�, nie uznaj� przemocy. Ale TEN cz�owiek zas�u�y� na to, �eby przerobi� mu troch� facjat�.
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
	description	 = 	"Pozna�em Valentina.";
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
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Pozna�em Valentina.
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //I?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Sprawi�em mu t�gie lanie...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //Zas�ugiwa� na to...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Podczas naszej ma�ej sprzeczki znalaz�em przy nim ten pier�cie�.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //Mo�esz go przekaza� nast�pnej osobie, kt�ra da mu w mord�...
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
	description	 = 	"Czy ostatnio wydarzy�o si� co� ciekawego?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Czy ostatnio wydarzy�o si� co� ciekawego?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Mo�na by tak powiedzie�.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Okradziono Bospera, miejscowego �uczarza. Co za tupet.
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Kole� po prostu wszed� do sklepu, w �rodku dnia, i zabra� stamt�d �uk.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //Bosper wyskoczy� za nim jak poparzony, krzycz�c: 'St�j, zatrzymaj si�, draniu!' Z�odziej jednak by� szybszy.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Ostatnio jaki� uczciwy znalazca odni�s� �uk Bosperowi.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //To dziwne, mog�oby si� wydawa�, �e ka�dy chce dla siebie jak najwi�cej, a ten kole� po prostu wraca i oddaje �uk.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //C�, wszystko po staremu. Je�li zaatakuj� nas orkowie, na pewno to zauwa�ymy...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Okaza�o si�, �e najemnik by� niewinny. Z tego co wiem, wypuszczono go na wolno��.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen musi by� zielony ze z�o�ci.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Ca�e miasto jest rozsierdzone. Pami�tasz paladyna Lothara?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //By� mo�e.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Tak czy inaczej, nie �yje. Jak zwykle, obwiniaj� najemnik�w.
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
	description	 = 	"Szukam za�ogi, kt�ra wyruszy�aby ze mn� na morze.";
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
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Szukam za�ogi, kt�ra wyruszy�aby ze mn� na morze.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //W tej kwestii nie mog� ci pom�c. Powiniene� poszuka� kogo� w okolicach portu, mo�e w okolicznych knajpach.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Je�li w mie�cie s� jeszcze jacy� �eglarze, to pewnie tam w�a�nie ich znajdziesz.

};


