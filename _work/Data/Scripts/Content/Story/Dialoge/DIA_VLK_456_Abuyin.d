// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Abuyin_EXIT(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 999;
	condition	= DIA_Abuyin_EXIT_Condition;
	information	= DIA_Abuyin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Abuyin_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Abuyin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Abuyin_PICKPOCKET (C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 900;
	condition	= DIA_Abuyin_PICKPOCKET_Condition;
	information	= DIA_Abuyin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Abuyin_PICKPOCKET_Condition()
{
	C_Beklauen (75, 200);
};
 
FUNC VOID DIA_Abuyin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_BACK 		,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
	
func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
// ************************************************************
// 			  		Hallo
// ************************************************************
INSTANCE DIA_Abuyin_Hallo(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Hallo_Condition;
	information	= DIA_Abuyin_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Abuyin_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_00");//(p�em��l�) ...je to divn�, ale m�m neodbytn� pocit, �e jsem t� u� n�kde vid�l, poutn�ku...
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_01");//No, �as a prostor jsou prost� z�hadn� elementy. Ale omluv mou nezdvo�ilost, � synu trp�livosti. Je�t� jsem t� ani nepozdravil.
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_02");//V�t�m t�, p��teli! Uveleb se na m�ch skrovn�ch koberc�ch a v klidu si vychutnej dobrou d�mku.
};
// ************************************************************
// 			  		Wer bist du?
// ************************************************************
INSTANCE DIA_Abuyin_du(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_du_Condition;
	information	= DIA_Abuyin_du_Info;
	permanent	= FALSE;
	description	= "Kdo jsi?";
};                       
FUNC INT DIA_Abuyin_du_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Abuyin_du_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_du_15_00");//Kdo jsi?
	AI_Output (self, other,"DIA_Abuyin_du_13_01");//Jmenuju se Ab� D��n ibn D�ad�r ibn Omar Chal�d ben H�d�� al-�ar�d�. Jsem v�tcem a prorokem, astrologem a dodavatelem tab�ku.
};
// ************************************************************
// 			  		Kraut
// ************************************************************
INSTANCE DIA_Abuyin_Kraut(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Kraut_Condition;
	information	= DIA_Abuyin_Kraut_Info;
	permanent	= FALSE;
	description	= "Jak� tab�k mi m��e� nab�dnout?";
};                       
FUNC INT DIA_Abuyin_Kraut_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_du)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Kraut_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Kraut_15_00");//Jak� tab�k nab�z�?
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_01");//M� d�mky jsou napln�ny pikantn�m a osv�uj�c�m jable�n�m tab�kem.
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_02");//Poslu� si, kdykoli bude� cht�t, synu dobrodru�stv�.
};
// ************************************************************
// 			  	anderen Tabak?
// ************************************************************
INSTANCE DIA_Abuyin_anderen(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_anderen_Condition;
	information	= DIA_Abuyin_anderen_Info;
	permanent	= FALSE;
	description	= "M� i jin� tab�k?";
};                       
FUNC INT DIA_Abuyin_anderen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_Kraut)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_anderen_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_anderen_15_00");//M� i jin� tab�k?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_01");//Nab�z�m pouze ten nejlep�� tab�k. Tato jable�n� sm�s m� podobn� vlastnosti jako tab�k z m� domoviny, Ji�n�ch ostrov�.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_02");//Ale samoz�ejm� se nijak nebr�n�m vyzkou�et jak�koli jin� druh - pokud tedy n�kdo dok�e vyrobit opravdu dobr� tab�k.
	AI_Output (other, self,"DIA_Abuyin_anderen_15_03");//Jak se to d�l�?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_04");//Jako z�klad doporu�uji m�j jable�n� tab�k. A pak m��e� vyzkou�et kombinace s dal��mi ingrediencemi.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_05");//V�roba prob�h� v alchymistick� kolon� a vy�aduje z�kladn� znalosti alchymie.
};
// ************************************************************
// 			  	Woher 
// ************************************************************
INSTANCE DIA_Abuyin_Woher(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Woher_Condition;
	information	= DIA_Abuyin_Woher_Info;
	permanent	= FALSE;
	description	= "Kde se d� sehnat jable�n� tab�k?";
};                       
FUNC INT DIA_Abuyin_Woher_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Woher_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Woher_15_00");//Kde se d� sehnat jable�n� tab�k?
	AI_Output (self, other,"DIA_Abuyin_Woher_13_01");//D�m ti dv� d�vky. Je jen na tv� moudrosti, jak s n�m nalo��.
	AI_Output (self, other,"DIA_Abuyin_Woher_13_02");//Pokud bude� cht�t dal��, zajdi p��mo za Zuridem, mistrem lektvar�. D�l� si sv�j vlastn� tab�k a tak� ho samoz�ejm� prod�v�.
	
	B_GiveInvItems (self, other, ItMi_ApfelTabak,2);
};
// ************************************************************
FUNC VOID B_TabakProbieren()
{
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_00");//Nech m� ten tab�k vyzkou�et.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_01");//Ne, ob�v�m se, �e mi tahle sm�s nebude vyhovovat. Ale mo�n� se ti poda�� nal�zt n�koho jin�ho, kdo ehm... ocen� takovou delikatesu.
};
// ************************************************************
// 			  	Mischung 
// ************************************************************
INSTANCE DIA_Abuyin_Mischung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 10;
	condition	= DIA_Abuyin_Mischung_Condition;
	information	= DIA_Abuyin_Mischung_Info;
	permanent	= TRUE;
	description	= "M�m novou sm�s tab�ku...";
};                       
FUNC INT DIA_Abuyin_Mischung_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	&& (Abuyin_Honigtabak == FALSE)
	&& ((Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_Honigtabak) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Mischung_Info()
{	
	
	AI_Output (other, self,"DIA_Abuyin_Mischung_15_00");//M�m novou sm�s tab�ku.
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
	Info_AddChoice (DIA_Abuyin_Mischung,DIALOG_BACK,DIA_Abuyin_Mischung_BACK);
	
	if (Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if (Npc_HasItems (other, ItMi_Honigtabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
};	
FUNC VOID DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Sumpf ()
{
	B_GiveInvItems (other, self, ItMi_SumpfTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Pilz ()
{
	B_GiveInvItems (other, self, ItMi_PilzTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Doppel ()
{
	B_GiveInvItems (other, self, ItMi_DoppelTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Super ()
{
	
	B_GiveInvItems (other, self, ItMi_Honigtabak, 1);
		
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_00");//Nech m� ten tab�k vyzkou�et.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_01");//Chutn� to p��mo neuv��iteln�! Nikdy jsem nic lep��ho nekou�il!
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_02");//Jak jsi tu sm�s p�ipravil?
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_03");//Sm�chal jsem tab�k s medem.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_04");//To se ti opravdu povedlo, ot�e um�n� m�sen�. Byl bych pot�en, kdybych sm�l sv� nuzn� d�mky naplnit tak vz�cnou sm�s�.
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_05");//Tak je napl�.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_06");//D�ky, synu velkorysosti. ��dn� jin� sm�s nem��e b�t tak dobr� jako tato. Koup�m od tebe ve�kerou sm�s tohoto druhu, co mi p�inese�.
	
	Abuyin_Honigtabak = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
};	
// ************************************************************
// 			  Honigtabak verkaufen 
// ************************************************************
INSTANCE DIA_Abuyin_Trade(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Trade_Condition;
	information	= DIA_Abuyin_Trade_Info;
	permanent	= TRUE;
	description	= "M�m pro tebe trochu medov�ho tab�ku.";
};                       
FUNC INT DIA_Abuyin_Trade_Condition()
{	
	if (Abuyin_Honigtabak == TRUE)
	&& (Npc_HasItems (other, ItMi_HonigTabak) >= 1) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Trade_Info()
{	
	Abuyin_Score = 0;
	
	Abuyin_Score = (Npc_HasItems (other, Itmi_Honigtabak)* Value_Itmi_Honigtabak);
	
	AI_Output (other, self,"DIA_Abuyin_Trade_15_00");//M�m pro tebe trochu medov�ho tab�ku.
	
	B_GiveInvItems (other, self, ItmI_HonigTabak, Npc_HasItems (other, Itmi_Honigtabak));
	B_GiveInvItems (self, other, ItmI_Gold, Abuyin_Score);
	
	AI_Output (self, other,"DIA_Abuyin_Trade_13_01");//Obchodovat s tebou je mi neskonal�m pot�en�m.
};
// ************************************************************
// 			  		Herb - KrautPaket
// ************************************************************
INSTANCE DIA_Abuyin_Herb(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Herb_Condition;
	information	= DIA_Abuyin_Herb_Info;
	permanent	= FALSE;
	description	= "Zaj�mal by t� tenhle bal��ek tr�vy?";
};                       
FUNC INT DIA_Abuyin_Herb_Condition()
{	
	if (Npc_HasItems (other, Itmi_Herbpaket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Herb_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Herb_15_00");//Zaj�mal by t� tenhle bal��ek drog?
	AI_Output (self, other,"DIA_Abuyin_Herb_13_01");//Bal�k bylinek - ne��kej, �e to je tr�va z ba�in. �, dej to pry�, synu lehkov�nosti.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_02");//Jestli m� s t�m chyt� m�stsk� str�e, po�lou m� rovnou za m��e - a ty nedopadne� o moc l�pe!
	AI_Output (self, other,"DIA_Abuyin_Herb_13_03");//Pokud chce� tu z�sobu prodat, d�m ti jednu radu - opus� tohle m�sto.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_04");//Pokus se toho zbavit n�kde za hradbami. V�echno, co za to m��e� dostat tady, je spousta trabl�.
};
// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung_Condition;
	information	= DIA_Abuyin_Weissagung_Info;
	permanent	= FALSE;
	description	= "M��e� mi p�edpov�d�t budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_00");//Dok�e� mi p�edpov�d�t budoucnost?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_01");//Za men�� poplatek jsem ti k slu�b�m, � ot�e velkorysosti.
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_02");//Kolik chce�?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_03");//Za pouh�ch 25 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_04");//Ale pamatuj - budoucnost je v�dycky nejist�. V�e, co mohu ud�lat, je zb�n� prol�tnout n�kolik �tr�k� �asu.
};
// ************************************************************
// 			Weisagen lassen Kapitel 1
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft_Condition;
	information	= DIA_Abuyin_Zukunft_Info;
	permanent	= TRUE;
	description	= "P�edpov�z mi budoucnost (zaplatit 25 zla��k�).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung)
	&& (DIA_Abuyin_Zukunft_permanent == FALSE)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft_15_00");//P�edpov�z mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 25)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_01");//Dobr�, hleda�i v�domost�. Te� se mus�m dostat do hypnotick�ho stavu. Jsi p�ipraven?
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		Info_AddChoice (DIA_Abuyin_Zukunft,"Jsem p�ipraven!",DIA_Abuyin_Zukunft_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_02");//�, ot�e minc�, ��d�m t� o 25 zlat�ch, za to, �e nahl�dnu do budoucnosti.
	};

};
FUNC VOID DIA_Abuyin_Zukunft_Trance()
{
		AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
		
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_00");//(V transu)... Sk�eti... hl�daj� vstup... star� chodba... Hornick� �dol�...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_01");//(V transu)... Mu� v z��iv� zbroji... m�g... je s n�m tv�j p��tel... �ek� na tebe...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_02");//(V transu)... Ohe�! �tok... mocn� stvo�en�... plameny... mnoho... jich zem�e...
		
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");//(V transu) Copak je tohle...? M�sto... Z��ceniny... Quarhodron v... v Jharkendaru...
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");//(V transu)...je vyvol�n... Quarhodron v Jharkendaru!
		
		AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_03");//Je mi l�to, ale vize je u konce. U� tu nen� nic, co bych mohl spat�it.
		
		DIA_Abuyin_Zukunft_permanent = TRUE; 
		Abuyin_Zukunft = 1;
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		
		B_GivePlayerXP ((XP_Ambient*4));
};
// ************************************************************
// 		Kannst du mir noch eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Nochmal(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Nochmal_Condition;
	information	= DIA_Abuyin_Nochmal_Info;
	permanent	= TRUE;
	description	= "M��e� mi prorokovat je�t� n�co jin�ho?";
};                       
FUNC INT DIA_Abuyin_Nochmal_Condition()
{	
	if (Kapitel == Abuyin_Zukunft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Nochmal_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Nochmal_15_00");//M��e� mi ud�lat je�t� dal�� proroctv�?
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_01");//� synu z�hadn� budoucnosti, nen� v m� moci poodhalit z�voj �asu.
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_02");//Pouze pokud mi �as se�le dal�� znamen�, budu schopen do n�j nahl�dnout znovu.
	
	if (Abuyin_Erzaehlt == FALSE)
	{
		AI_Output (other, self,"DIA_Abuyin_Nochmal_15_03");//A kdy to bude?
		AI_Output (self, other,"DIA_Abuyin_Nochmal_13_04");//A� se budoucnost stane p��tomnost� a ty bude� pokra�ovat ve sv� cest�.
		Abuyin_Erzaehlt = TRUE;
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

FUNC void B_Abuyin_Weissagung ()
{	
	AI_Output (other, self,"B_Abuyin_Weissagung_15_00");//M��e� mi p�edpov�d�t budoucnost?
	AI_Output (self, other,"B_Abuyin_Weissagung_13_01");//Ano, �as postoupil a j� ti na opl�tku za n�kolik minc� sd�l�m proroctv�.
	AI_Output (other, self,"B_Abuyin_Weissagung_15_02");//Kolik?
};


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung2_Condition;
	information	= DIA_Abuyin_Weissagung2_Info;
	permanent	= FALSE;
	description	= "M��e� mi p�edpov�d�t budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung2_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung2_13_00");//Za pouh�ch 100 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};
// ************************************************************
// 			Weisagen lassen Kapitel 2
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft2_Condition;
	information	= DIA_Abuyin_Zukunft2_Info;
	permanent	= TRUE;
	description	= "P�edpov�z mi budoucnost (zaplatit 100 zla��k�).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft2_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung2)
	&& (DIA_Abuyin_Zukunft2_permanent == FALSE)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft2_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft2_15_00");//P�edpov�z mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 100)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_01");//Dobr�, synu udatnosti. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft2);
		Info_AddChoice (DIA_Abuyin_Zukunft2,"Jsem p�ipraven!",DIA_Abuyin_Zukunft2_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_02");//� ot�e minc�, ��d�m t� o 100 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};

};	
FUNC VOID DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_00");//(V transu)... �old�k... bude t� pot�ebovat... stra�n� vra�da... Oko...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_01");//(V transu)... Zlov�stn� stoupenci... p�ich�zej�... hledaj� tebe... str�ce padne...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_02");//(V transu)... ale t�i se spoj�... jedin� pak z�sk�, co ti n�le��...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_03");//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
	
	DIA_Abuyin_Zukunft2_permanent = TRUE; 
	Abuyin_Zukunft = 2;
	Info_ClearChoices (DIA_Abuyin_Zukunft2);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung3_Condition;
	information	= DIA_Abuyin_Weissagung3_Info;
	permanent	= FALSE;
	description	= "M��e� mi p�edpov�d�t budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung3_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung3_13_00");//Za pouh�ch 250 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};
// ************************************************************
// 			Weisagen lassen Kapitel 3
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft3_Condition;
	information	= DIA_Abuyin_Zukunft3_Info;
	permanent	= TRUE;
	description	= "P�edpov�z mi budoucnost (zaplatit 250 zla��k�).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft3_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung3)
	&& (DIA_Abuyin_Zukunft3_permanent == FALSE)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft3_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft3_15_00");//P�edpov�z mi budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 250)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_01");//Dobr�, synu v�domost�. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft3);
		Info_AddChoice (DIA_Abuyin_Zukunft3,"Jsem p�ipraven!",DIA_Abuyin_Zukunft3_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_02");//� ot�e minc�, ��d�m t� o 250 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};

};	
FUNC VOID  DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_00");//(V transu)... Mus� donutit... co nen� osud nikoho jin�ho, pouze tv�j...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_01");//(V transu)... p�es sn�h a ohe�... p�es led a plameny...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_02");//(V transu)... Mu�i v podivn� zbroji... ba�iny... je�t��i... �ekaj� na tebe...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_03");//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
	
	DIA_Abuyin_Zukunft3_permanent = TRUE; 
	Abuyin_Zukunft = 3;
	Info_ClearChoices (DIA_Abuyin_Zukunft3);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung4_Condition;
	information	= DIA_Abuyin_Weissagung4_Info;
	permanent	= FALSE;
	description	= "M��e� mi p�edpov�d�t budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung4_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung4_13_00");//Za pouh�ch 500 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};
// ************************************************************
// 			Weisagen lassen Kapitel 4
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft4_Condition;
	information	= DIA_Abuyin_Zukunft4_Info;
	permanent	= TRUE;
	description	= "P�edpov�z mi budoucnost (zaplatit 500 zla��k�).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft4_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung4)
	&& (DIA_Abuyin_Zukunft4_permanent == FALSE)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft4_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft4_15_00");//P�edpov�z mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 500)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_01");//Dobr�, synu v�domost�. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft4);
		Info_AddChoice (DIA_Abuyin_Zukunft4,"Jsem p�ipraven!",DIA_Abuyin_Zukunft4_Trance);	
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_02");//� ot�e minc�, ��d�m t� o 500 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};

};
FUNC VOID DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_00");//(V transu)... M�sto v�domost�... jin� zem�... temn� m�sto �iroko daleko...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_01");//(V transu)... udatn� spole�n�ci... mus� zvolit...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_02");//(V transu)... chr�m... le�� osamocen v Adanov� ��i... skryt� v mlze...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_03");//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
	
	DIA_Abuyin_Zukunft4_permanent = TRUE; 
	Abuyin_Zukunft = 4;
	Info_ClearChoices (DIA_Abuyin_Zukunft4);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung5_Condition;
	information	= DIA_Abuyin_Weissagung5_Info;
	permanent	= FALSE;
	description	= "M��e� mi p�edpov�d�t budoucnost?";
};                       
FUNC INT DIA_Abuyin_Weissagung5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung5_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung5_13_00");//Za pouh�ch 1000 zlat�ch budu kv�li tob� riskovat pohled skrze �as.
};
// ************************************************************
// 			Weisagen lassen Kapitel 5
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft5_Condition;
	information	= DIA_Abuyin_Zukunft5_Info;
	permanent	= TRUE;
	description	= "P�edpov�z mi budoucnost (zaplatit 1000 zla��k�).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft5_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung5)
	&& (DIA_Abuyin_Zukunft5_permanent == FALSE)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft5_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft5_15_00");//P�edpov�z mi mou budoucnost.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 1000)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_01");//Dobr�, synu v�domost�. Te� se dostanu do hypnotick�ho stavu. Jsi p�ipraven?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft5);
		Info_AddChoice (DIA_Abuyin_Zukunft5,"Jsem p�ipraven!",DIA_Abuyin_Zukunft5_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_02");//�, ot�e minc�, ��d�m t� o 1000 zlat�ch za to, �e nahl�dnu do budoucnosti.
	};

};
FUNC VOID DIA_Abuyin_Zukunft5_Trance ()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_00");//(V transu)... Temnota pohlt� zemi... zlo zv�t�z�...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_01");//(V transu)... kr�l prohraje v�lku se sk�ety...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_02");//(V transu)... vr�t� se, ale nenalezne� klidu...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_03");//To je v�e. Nen� nic, co bych je�t� mohl spat�it.
		
	DIA_Abuyin_Zukunft5_permanent = TRUE; 
	Abuyin_Zukunft = 5;
	
	Info_ClearChoices (DIA_Abuyin_Zukunft5);
	
	B_GivePlayerXP ((XP_Ambient*4));
};

