///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_EXIT   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 999;
	condition   = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pablo_PICKPOCKET (C_INFO)
{
	npc			= Mil_319_Pablo;
	nr			= 900;
	condition	= DIA_Pablo_PICKPOCKET_Condition;
	information	= DIA_Pablo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento kl�� by ukradlo i mal� d�t�.)";
};                       

FUNC INT DIA_Pablo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Pablo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pablo_PICKPOCKET);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_BACK 		,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pablo_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
//--------------------

instance DIA_Pablo_WANTED		(C_INFO)
{
	npc			 = 	Mil_319_Pablo;
	nr			 = 	1;
	condition	 = 	DIA_Pablo_WANTED_Condition;
	information	 = 	DIA_Pablo_WANTED_Info;
	important	 = 	TRUE;
};
func int DIA_Pablo_WANTED_Condition ()
{
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
func void DIA_Pablo_WANTED_Info ()
{
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hej, po�kej - jsi mi n�jak� pov�dom�.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Co chce�?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //Tv�j obli�ej jsem u� n�kde vid�l... ano - u� v�m!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Tady - tenhle obr�zek u sebe m�la skupina bandit�, kterou jsme sbalili p�ed p�r dny. Vypad� v�n� jako ty.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Zd� se, �e t� ti chlap�ci hledali.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Ne, musel ses spl�st.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Bo��nku, n�co takov�ho by m� samotn�ho nikdy nenapadlo.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Ne, to se ur�it� pletete. To musel b�t n�kdo jin�.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Jak mysl�, cizin�e.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie au�erhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Ale jestli se nakonec uk�e, �es na tom obr�zku p�ece jenom byl TY - a pokud bude� m�t n�jak� pot�e - sna� se je netahat s sebou do m�sta. U� takhle to tady nen� ��dn� med.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //A cizinci, kte�� s sebou p�in�ej� pot�e, tady moc dlouho v�t�inou nez�stanou - douf�m, �e jsem se vyj�d�il jasn�.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //Bo��nku, n�co takov�ho by m� samotn�ho nikdy nenapadlo.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //V�n� legrace... co od tebe ti chlap�ci cht�li?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Zeptejte se jich sami. M�te je p�ece v bezpe�� pod z�mkem, ne?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Ne - jsou mrtv�.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //Tak m�m dojem, �e se to u� nikdy nedozv�me.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Sch�nen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //V p��pad�, �e bys m�l n�jak� probl�my, promluv si s lordem Andrem. Mo�n� by byl schopn� ti pomoci. Najde� ho v kas�rn�ch.
	
	AI_StopProcessInfos (self);
};

// *************************************************************
// 							Banditen
// *************************************************************
INSTANCE DIA_Pablo_Banditen   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent   = FALSE;
	description = "Co v� o banditech?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //Co v� o banditech?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was wei�t du �ber die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //V�ichni poch�zej� z t� zatracen� t�a�sk� kolonie. Je mezi nimi ale n�kolik skupinek odpadl�k�.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //N�kte�� se za�ili v hor�ch a dal�� se spojili s Onarem, velkostatk��em.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Nejv�c pot�� ale zp�sobuj� bandit�, kte�� se zdr�uj� mimo m�sto.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //To kv�li nim se te� ��dn� obchodn�k neodv�� vyrazit za m�stsk� br�ny.
};

// *************************************************************
// 							HakonBandits
// *************************************************************
INSTANCE DIA_Pablo_HakonBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent   = FALSE;
	description = "Nev� n�co o banditech, kte�� okradli obchodn�ka Hakona?";
};
FUNC INT DIA_Pablo_HakonBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_HakonBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Nev� n�co o banditech, kte�� okradli obchodn�ka Hakona?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Jo TOHLE. Ani mi to nep�ipom�nej.
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Co v�me, tak maj� na sv�dom� u� p�knou ��dku �tok� na r�zn� kupce.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Ty krysy zalezly do sv�ch d�r a neodva�uj� se ani vystr�it nos.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Kdysi se n�m je poda�ilo vystopovat a sledovat. V lese za m�stem jsme ale museli s pron�sledov�n�m p�estat.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //Kolem se potuluje spousta �elem, je to moc nebezpe�n�.
	
	B_LogEntry(TOPIC_HakonBanditen,"Bandit�, kte�� okradli Hakona, se skr�vaj� kdesi v les�ch pobl� m�sta." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Ale je tady je�t� jedna v�c...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //V Khorinidu se objevila ��st uloupen�ho zbo��.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //To znamen�, �e v�d�, jak lup propa�ovat do m�sta a pak ho tady prodat...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Jo, m�me podez�en�, �e maj� tady n�kde ve m�st� p�ekupn�ka. Zat�m se n�m ale toho chl�pka nepoda�ilo chytit.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Pokud by se ti poda�ilo na n�co p�ij�t, tak m�j na pam�ti, �e lord Andre vypsal na toho pa�er�ka odm�nu.
	
		B_LogEntry(TOPIC_HakonBanditen,"Bandit� maj� ve m�st� nejsp� n�jakou spojku. Lord Andre nechal na tohoto jejich spojence vypsat odm�nu." );
	};
}; 

// *************************************************************
// 							MyBandits
// *************************************************************
INSTANCE DIA_Pablo_MyBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 4;
	condition   = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent   = FALSE;
	description = "Odkud byli ti bandit�, kte�� m�li ten m�j obr�zek?";
};
FUNC INT DIA_Pablo_MyBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Wanted))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_MyBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Odkud byli ti bandit�, kte�� m�li ten m�j obr�zek?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //AH�! Tak�e to nakonec BYL tv�j obli�ej. Pro� jsi to nep�iznal hned, co?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(nal�hav�) Pro� po tob� jdou?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //J� nev�m - v�n�!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Jasn�, jasn�. Ch�pu. N�co ti �eknu. Kdybych si myslel, �e jsi s t�mi bandity jedna ruka, u� bys p�kn� bru�el v chl�dku. Kapi�to?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //I tak bych to ale asi m�l nahl�sit lordu Andremu...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Ale co se t��e t� tv� ot�zky...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Sebrali jsme je pobl� statk��ova s�dla.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Rozhodn� ale nevypadaj� jako Onarovi lid�.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //�ekl bych, �e to byla ��st men�� skupinky, kter� se ukr�v� v hor�ch pobl� Onarovy farmy.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Jestli bys ale m�l v pl�nu se tam vydat, mus�m t� varovat. Tihle hrdlo�ezov� provedou s ka�d�m kr�tk� proces!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Budu to m�t na pam�ti.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_Perm   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 1;
	condition   = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Jak to vypad�?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //V�dycky jsem ��kal, �e se t�m �old�k�m ned� v��it.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Je na�ase, abychom t�m ne��d�m u�t�d�ili lekci. Tohle nevymyslel Bennet s�m o sob�.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Jsem hluboce ot�esen vra�dou ctihodn�ho paladina Lothara.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Ale v���m, �e c�rkev vin�ky spravedliv� potrest�.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Co �e se tady potuluje� po okol�? Jestli m� v pl�nu osvobodit sv�ho �old�ck�ho p��tel��ka, tak na to rovnou zapome�.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //To je k pl��i. Te� se n�s sna�� po�tvat proti sob� navz�jem.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Jestli nedok�ete naj�t prav�ho vraha, sk�eti nebudou muset ani hnout prstem.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //D�l� mi starosti, co se stane, kdy� te� paladinov� odejdou.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Na n�s se m��e� spolehnout. Pou�ijeme v�echny dostupn� prost�edky, aby tohle m�sto nezab�edlo do bahna bezpr�v�.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //M�j se na pozoru. Dareb�ky jako ty nespou�t�me jen tak z o��.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //Te� je docela klid. Probl�my n�m d�laj� jen bandit� za hradbami.
	};	

}; 


