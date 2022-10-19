// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "Vyraz�m hned, jak budu moci! (KONEC)";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Vyraz�m hned, jak budu moci!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Dobr�! A je�t� jedna v�c: ne��kej nikomu, �e jsme spolu mluvili. Hlavn� to ne��kej ��dn�mu m�govi.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Co jsem ode�el, pova�uj� m� m�gov� ohn� za mrtv�ho - a to se m��e docela hodit.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: mu� auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Tak u� je to tu zas! (s �sm�vem) Nikdy jsem si nemyslel, �e se my dva je�t� n�kdy sejdeme.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //M�m pocit, jako bych str�vil t�i ned�le pod hromadou balvan�.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //Taky �e ano. Na�ivu t� udr�ela jenom magie ve tv� zbroji. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //B�l jsem se, �e t� z trosek toho chr�mu u� nezachr�n�m.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Ale na tom u� nez�le��. Te� jsi tady.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Te� m�me na krku NOVOU hrozbu.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "M�me te� spoustu �asu. Sp�� byl p�ece pora�en.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "O jak� NOV� hrozb� to mluv�?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Mus�me se s nimi spojit! Pouze tak m��eme Beliara zastavit!
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Te� alespo� m�me dost �asu. Postaral jsem se o to. Sp��...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //...byl zapuzen. Porazil jsi ho, to je naprost� pravda - ale nen� v na�� moci zastavit v�lku, kter� bude te� n�sledovat.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Sv�m posledn�m zb�sil�m sk�ekem vyslal Sp�� na cestu arm�dy temnot.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Byl to rozkaz ur�en� v�em zl�m stv�r�m. Mocn� zakl�nadlo, kter� nemohou neuposlechnout.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Jeho posledn� rozkaz byl: P�IJ�TE! A p�i�li. V�ichni. Dokonce i draci.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(u�asle) Draci!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Jsou to prad�vn� stvo�en� neb�val� moci. C�t�m jejich p��tomnost - dokonce i zde.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Shrom�dili kolem sebe celou arm�du ni���ch stv�r, aby jim slou�ily.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Kde je ta arm�da te�?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Ut�bo�ila se nedaleko odsud, v Hornick�m �dol� pobl� Khorinidu. Pomalu se p�ipravuje k �toku.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(zamy�len�) Moc �asu n�m nezb�v�.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Ale to je�t� nen� v�echno. Ned�vno jsem se dozv�d�l je�t� o DAL�� hrozb�.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "O jak� JIN� hrozb� to mluv�?", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Tak si posp�me, abychom byli co nejrychleji pry�!";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Tak si posp�me, abychom byli co nejrychleji pry�!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Pokud te� ute�eme, bude to znamenat jedin� - budeme se muset drak�m postavit pozd�ji.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //S pomoc� voj�k� a m�g�, kte�� �ij� v t�chto kon�in�ch, bychom mohli jejich arm�du zastavit d��v, ne� se �pln� zformuje.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Lep�� �anci u� nikdy m�t nebudeme.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Co budeme d�lat te�?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Co budeme d�lat?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Tentokr�t to sami nezvl�dneme. Proti t�m drak�m n�m m��e pomoci jen Innosova moc.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //Ve m�st� Khorinis s�dl� skupina paladin�, je to nedaleko odsud.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Maj� mocn� artefakt, kter� by n�m mohl v boji proti drak�m hodn� pomoci.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //��kaj� mu Innosovo oko. Mus� ten artefakt za ka�dou cenu z�skat.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Vysv�tli paladin�m, jak� nebezpe�� n�m hroz�. MUS͊ p�esv�d�it jejich v�dce, aby n�m pomohl!
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //A a� si s n�m promluv�, mus� naj�t Beliar�v artefakt.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //Je protikladem Oka Innosova. Nesm� padnout do nespr�vn�ch rukou.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"V Khorinidu se usadila skupina paladin�, kte�� opatruj� mocn� artefakt zvan� Innosovo oko, jen� n�m m��e pomoci zahnat dra�� hrozbu. Mus�m ty svat� bojovn�ky n�jak p�esv�d�it, aby se k n�m p�idali."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"M��e� mi ��ct n�co o t�hle kamenn� tabulce?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //M��e� mi n�co ��ci o t�hle kamenn� tabulce?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der H�hlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //Nap�ed jsem ji pova�oval za magick� artefakt, ale nakonec jsem do�el k z�v�ru, �e nen� nijak zvl᚝ d�le�it�.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //�pln� jsem ji sice nerozlu�til, ale podle v�eho pojedn�v� o historii n�jak� velmi star� kultury.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Jestli tu tabulku chce�, tak si ji vezmi. Mn� k ni�emu nen�.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "Vodn� m�gov� objevili port�l, kter� vede do nezn�m� ��sti ostrova...";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Vodn� m�gov� objevili port�l do nezn�m� ��sti ostrova...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Zaj�mav�...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Pokud objev� n�co, co n�m SKUTE�N� k n��emu bude, pak mi to ur�it� oznam!
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //Ten Beliar�v artefakt mus� b�t ukryt� n�kde tady. Najdi jej!
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "K t� nezn�m� ��sti ostrova...";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //Co se t��e t� nezn�m� ��sti ostrova...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Neotravuj m� podrobnostmi. Vra� se, a� najde� n�co opravdu zaj�mav�ho.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "Prozkoumal jsem tu nezn�mou ��st ostrova...";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //Prozkoumal jsem nezn�mou ��st ostrova.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //A co jsi tam objevil?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //V�echno se to�ilo kolem mocn�ho artefaktu zvan�ho Beliar�v dr�p.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //Beliar�v dr�p? A kde je? M� jej s sebou?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Ano, tady je.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(chtiv�) To je nesm�rn� zaj�mav�.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Tahle zbra� se n�m m��e velice hodit. Ale z�rove� je nesm�rn� nebezpe�n�.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Bu� opatrn�! A hlavn� ji neztra�!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //U� ji nem�m.
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Dal jsem ji vodn�m m�g�m, kte�� ji hod� do mo�e...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(vztekle vyk�ikuje) Copak ses zbl�znil? M� v�bec pon�t�, �eho se vzd�v�?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Ta zbra� n�m mohla velmi poslou�it!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Mysl�m, �e takhle to bude lep��.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(povzdechne si) Cesty bo�� jsou nevyzpytateln�.
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Pot�ebuji zbran�.";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Pot�ebuji zbran�.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //M��u ti d�t jen to m�lo, co tady m�m.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Porozhl�dni se po m� v�i. Vem si cokoliv, o �em bude� p�esv�d�en, �e by se ti mohlo hodit.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Co p�esn� je to 'Innosovo oko'?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Co p�esn� je to 'Innosovo oko'?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //Je to amulet. Legenda vypr�v�, �e do n�j vlo�il ��st sv� s�ly s�m Innos.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Obnov� ��st tv� ztracen� s�ly a pom��e n�m porazit draky.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //M� tak� dal�� skryt� schopnosti. O nich ti pov�m v�c, a� ho bude� m�t u sebe.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Pro� by mi m�li paladinov� Innosovo oko d�vat?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Pro� by mi m�li paladinov� Innosovo oko d�vat?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Proto�e ty jsi ten, komu osud ur�il, aby jej nosil.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Jak m��e� v�d�t n�co takov�ho?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //M�m hned n�kolik d�vod� si to myslet, ale nejd�le�it�j�� je ten, �e jsi porazil Sp��e. Kdybys nebyl obl�benec boh�, byl bys te� mrtv�.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //�ekn�me, �e m� pravdu a �e jsem vyvolen�, abych nesl Innosovo oko. Jak ale paladinov� poznaj�, �e to je pravda?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //Oko samo si zvol� toho, kdo jej m��e m�t. Jakmile se k n�mu dostane� a nasad� si ho, nebudou paladinov� moci o tv�ch slovech d�l pochybovat.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Jak se dostanu do m�sta?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Jak se dostanu do m�sta?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Jdi po cest� vedouc� odsud skrz hory. M�sto je velk�. Nem��e� ho minout.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Ale d�vej si pozor! Cesta do m�sta nen� �pln� bezpe�n�. A ty nejsi zdaleka tak siln�, jak jsi kdysi b�val.
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde p�esn� to vlastn� jsme?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //A kde to v�bec jsme?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //Jak jsem u� �ekl, pobl� m�sta Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Postavil jsem si zde znovu svou v�.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Ale v�dy� je to jen p�r dn�, co jsme se naposledy vid�li v Hornick�m �dol�...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //Slu�ebn�ci, kter� jsem k obnoven� sv� v�e povolal, odvedli d�kladnou pr�ci...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Taky m�m ten pocit.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde najdu lep�� v�bavu?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Kde najdu lep�� v�bavu?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //Nejbli��� m�sto, kde m��e� naj�t lep�� zbran� a brn�n�, je m�sto Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Ale dole v �dol� m��e� tu a tam naj�t l��iv� bylinky, kter� ti pomohou, kdy� bude� zran�n v boji.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Vid� to jezero hned p�ed mou v��? Od n�j vede do �dol� tajn� cesta.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mluvil jsi u� s Lesterem?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Mluvil jsi u� s Lesterem?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Ano, zasypal jsem ho ot�zkami. �ekl mi toho hodn�, ale byl �pln� vy�erpan�.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //Je vlastn� z�zrak, �e ten �t�k v�bec p�e�il. Poslal jsem jej, a� si odpo�ine.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Co ti �ekl?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Boj�m se, �e nic dobr�ho. Nejen �e vid�l draka, ale tak� mu�e v �ern�ch k�p�ch.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //A?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Pokud ti mu�i skute�n� existuj�, p�edstavuje jejich p��tomnost mo�nou hrozbu.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //A to se mi moc nel�b�. Na, vezmi si m�j prsten. Ochr�n� t� p�ed magi�.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Byl jsem ve m�st�...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //Byl jsem ve m�st�.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //A? Poda�ilo se ti promluvit si s v�dcem paladin�?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Nepustili m� k n�mu.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //Nesmysl! Mus� existovat zp�sob, jak se k n�mu dostat.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Kdy� sel�e v�echno ostatn�, vstup do kl�tera a sta� se m�gem.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Mo�n� to je z mor�ln�ho hlediska tro�ku pochyben�, ale ��el sv�t� prost�edky.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Pokud bude� m�gem, ur�it� setk�n� s tebou neodm�tne.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tak co ud�l�me te�?";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Tak co ud�l�me te�?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Budeme postupovat podle pl�nu. Jinak to nejde.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Ty b� z�skat Innosovo oko a j� budu hledat odpov�di.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Pro� by o tob� nem�l 'kruh ohn�' v�d�t?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Pro� o tob� nemaj� m�gov� ohn� v�d�t?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//B�val jsem vysoko postaven� �len kruhu. U� tenkr�t jsem m�l podez�en�, �e kl��em k magick� bari��e by mohla b�t magie d�mon�.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Nikdy se mi v�ak nepoda�ilo p�esv�d�it ostatn� �leny kruhu, aby sledovali tuhle stopu.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Opustil jsem tedy kruh, abych mohl studovat �ern� um�n�.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //A to je zlo�in, pro kter� ohniv� m�gov�, (j�zliv�) 'Innosovi slu�ebn�ci', v�dy 'Dob��' a 'Ctnostn�', nikdy nep�ijmou ��dnou omluvu.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Jsou si jisti, �e jsem st�le na�ivu, ale v�bec netu��, kde m� hledat - a to je jedin� dob�e.
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"Vr�til jsem se z Hornick�ho �dol�.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Vr�til jsem se z Hornick�ho �dol�.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //U� bylo na�ase. Co jsi vid�l?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //M�l jsi pravdu. Cel� zem� se hem�� nep��telskou arm�dou.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Sk�eti obl�haj� hrad a draci zpusto�ili cel� kraj.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Jestli se nepletu, tak nebude dlouho trvat a za�to�� na Khorinis.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"Co se to tu proboha stalo?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester ��kal, �e m� chce� okam�it� vid�t.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Co se to tu proboha stalo?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //Nep��tel se dozv�d�l, kdo ve skute�nosti jsi, a chce se zmocnit Innosova oka.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Zjistil, jak� hrozba se na n�j �ene. Donutilo ho to opustit �kryt a p�ej�t do �toku.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Je konec hry na schov�vanou. Je�t� v�era nikdo nev�d�l, jak bude nep��telsk� �tok vypadat. Te� je to nad slunce jasn�.

	B_LogEntry (TOPIC_INNOSEYE, "Nep��tel se dozv�d�l, �e hled�m Innosovo oko. Je na�ase je z�skat, ne� bude p��li� pozd�.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Za�to�ili na m� n�jac� m�gov� v �ern�ch h�bitech.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Kone�n� jsem z�skal d�kaz pro lorda Hagena.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Za�to�ili na m� m�gov� v �ern�ch r�b�ch.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //Nep��tel m� mnoho podob. P�tra�i jsou jednou z nich. Oni jsou t�mi, kdo p�ipravuje p�du pro nep��tele.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Zaujali pozice na strategick�ch m�stech a te� jen �ekaj� na vhodnou p��le�itost, aby spustili past.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Vyh�bej se jim. Jsou to mocn� magick� stvo�en� a pokus� se t� odstranit z cesty za ka�dou cenu.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas ty �ern� od�n� m�gy zn�. P�tra�i jsou pravd�podobn� t�m, kdo na�e nep��tele ovl�d�. Jsou nesm�rn� nebezpe�n�."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Kone�n� m�m d�kaz, kter� po mn� lord Hagen cht�l.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //Co je to za d�kaz?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //Dostal jsem dopis od Garonda, velitele paladin� z Hornick�ho �dol�. ��d� v n�m o posily.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //To by snad m�lo toho bojechtiv�ho politika p�esv�d�it. Dobr� pr�ce.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Co ud�l�me te�?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Co ud�l�me te�?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Jdi a dones lordu Hagenovi dopis od Garonda, m�l by ti umo�nit p��stup k Innosovu oku.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Pak b� do kl�tera a promluv si s Pyrokarem. Bude ti muset Oko d�t.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Nic nen� d�le�it�j��ho ne� dostat ten artefakt do bezpe��.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Te� b�, dokud nen� pozd�. I nep��tel se ho ur�it� pokus� z�skat.
	B_LogEntry (TOPIC_INNOSEYE, "Oko se nach�z� v kl�tere m�g� ohn�. Doufejme, �e mi tam lord Hagen nyn� dovol� vej�t, kdy� jsem mu p�edal zpr�vu od lorda Garonda. Hlavn� m�g Pyrokar m� toti� bez Hagenova svolen� k amuletu v�bec nepust�.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"Innosovo oko bylo zni�eno.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //Innosovo oko bylo zni�eno.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Co to ��k�? Zni�eno!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Tohle jsem na�el naho�e v severn�ch les�ch - bohu�el se mi poda�ilo z�skat u� jen jeho �lomky.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //Byla to na�e jedin� nad�je, jak obst�t v boji s draky. Te� je v nen�vratnu. Selhali jsme.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Co te�?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Co te�?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //To je bolestn� zpr�va. Mus�me se sami v t�hle situaci zorientovat. Zkus�m naj�t n�jak� �e�en�.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //Mezit�m bys m�l zaj�t do m�sta a promluvit si s vodn�m m�gem Vatrasem. Je mo�n�, �e bude v�d�t, co by m�lo b�t ud�l�no.

	B_LogEntry (TOPIC_INNOSEYE, "Zpr�va o zni�en� Oka Innosova Xardase rozhodn� nepot�ila. Na�� jedinou nad�j� je nyn� m�g vody jm�nem Vatras, kter� s�dl� ve m�st� Khorinidu.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"Pos�l� m� za tebou Vatras.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Pos�l� m� za tebou Vatras.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //To je dob�e. Co �ekl?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Pov�dal n�co o obr�cen�m ritu�lu ve slune�n�m kruhu.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(zasm�je se) Ten star� pekeln�k. Mysl�m, �e v�m, co m� za lubem. P�i�el jsi, abys m� dostal k n�mu.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //Vypad� to tak. Kdy vyraz� na cestu?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Nesm�m nechat Vatrase �ekat. Okam�it� se vyd�m na cestu. Spl�, co mus�, a pak se ke mn� znovu p�idej.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas souhlasil, �e se z��astn� ritu�lu kruhu Slunce.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Z��astn�m se ritu�lu a� ve chv�li, kdy si budu jist, �e jsi pln� p�ipraven utkat se s draky.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"Pro� nejde� za Vatrasem HNED?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Pro� nejde� za Vatrasem HNED?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //N�kdy ti prost� nerozum�m.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(rozzloben�) Nemluv se mnou t�mto t�nem. Neb�t M�, tvoje b�dn� t�lo by je�t� hnilo v tom chr�mu.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Co se d� d�lat. Alespo� mi �ekni, co bych m�l ud�lat.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Tak mi alespo� vysv�tli, pro� v�h�.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Tak mi alespo� vysv�tli, pro� v�h�.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Od chv�le, kdy jsem opustil ohniv� m�gy, jsem se jim dr�el co mo�n� z cesty.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //A na tom nehodl�m nic m�nit, leda�e bych nem�l na vybranou.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Ale ne� se vystav�m vy��tav�m pohled�m ostatn�ch m�g�, chci m�t jistotu, �e m� proti drak�m alespo� n�jakou �anci.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //S t�m sv�m o�unt�l�m vybaven�m se ale moc daleko nedostane�. Vra� se, a� bude� dostate�n� siln�.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Co se d� d�lat. Alespo� mi �ekni, co bych m�l ud�lat.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Na boj s draky jsi po��d p��li� slab�. S touhle v�bavou nem� v�bec ��dnou �anci.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Nevracej se, dokud nebude� l�pe p�ipraven. Pak se vyd�m za Vatrasem.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"Jsem p�ipraven bojovat s draky.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Jsem p�ipraven bojovat s draky.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //V tom p��pad� u� nem��eme pl�tvat �asem. Okam�it� se vyd�m do slune�n�ho kruhu. Spl�, co mus�. Setk�me se tam.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas souhlasil, �e se z��astn� ritu�lu kruhu Slunce.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bude ritu�l zvratu fungovat?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Bude obr�cen� ritu�l fungovat?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //To nem��u v�d�t najisto. Z�le�� to na tom, co p�esn� chce Vatras ud�lat.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"Pyrokar se odm�t� z��astnit ritu�lu.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar odm�t� z��astnit se ritu�lu.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //P�edev��m chce d�kaz, �e ti m��e v��it.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //No ano. Pyrokar. Velice zaj�mav�.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Z toho starocha se st�v� docela mrzout. Ale mysl�m, �e pro tebe m�m n�co u�ite�n�ho.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Kdy� jsem kdysi opou�t�l ��d ohniv�ch m�g�, vzal jsem si z kl�tera p�r v�c�.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich st�ndig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen k�nnte - Satz ist eh �berfl�ssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Necht�l jsem, aby n�hodou p�i�la skupina paladin� nebo ohniv�ch m�g�, prohledali v� skrz naskrz a ty v�ci na�li.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Tak jsem je schoval na bezpe�n� m�sta, kde by je m�gov� ur�it� nikdy nehledali.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //A kde?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //N�kter� z nich jsou zam�en� v truhle na Sekobov� farm�.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Tomu Sekobovi v���?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Ne. Ale je mo�n� ho koupit a neklade ��dn� o�idn� ot�zky. Ta truhla je nav�c zam�en�. Tady m� kl��.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Mezi t�mi v�cmi je jedna velice star� kniha. A� ji Pyrokar spat��, bude v�d�t, �e poch�z� ode m�.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //U� mi nen� k ni�emu. Ale �ekl bych, �e k tomuhle �kolu by se mohla docela dob�e hodit.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas mi dal kl�� od truhlice na Sekobov� statku. Knihu, kterou uvnit� najdu, m�m zan�st Pyrokarovi.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Te�, kdy� je Innosovo oko opraveno, se mus� postavit drak�m!
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //V�ichni slou�� Beliarovi, bohu temnot.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Mus� ale existovat n�jak� pozemsk� s�la, kter� je ovl�d�. To je mi jasn�.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Zjisti, co za s�lu je ovl�d�.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Vra� se sem, jakmile to zjist�!
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Za��t");
  	B_StartOtherRoutine	(Vatras,"Za��t");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Innosovo oko je uzdraveno. Co d�l?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //Innosovo oko je opraveno. Co d�l?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //Nezapome� ho m�t na sob�, a� bude� st�t drak�m tv��� v tv��.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Neztr�cej �as. B� do Hornick�ho �dol� a zabij ty draky.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Jdi za Pyrokarem, a� ti vysv�tl�, jak Oko pou��vat.
	};
};		


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co je nov�ho?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //Co je nov�ho?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //P�tra�i je�t� neode�li. Nedaj� si pokoje, dokud t� nedostanou.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Zabij draky v Hornick�m �dol� a zjisti, kdo za t�mi �toky stoj�. Jinak bude jejich s�la neust�le nar�stat.

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



























































