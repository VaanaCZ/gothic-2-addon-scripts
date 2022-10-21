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
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_00");//Dziwne... Wydajesz mi si� znajomy, podr�niku.
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_01");//C�... Niezbadane s� tajniki czasu i przestrzeni... Wybacz mi brak grzeczno�ci, synu cierpliwo�ci - nie zosta�e� nawet jeszcze powitany...
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_02");//Witaj, przyjacielu. Usi�d� na mym dywanie i zaci�gnij si� dymem z fajki.
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
	description	= "Kim jeste�?";
};                       
FUNC INT DIA_Abuyin_du_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Abuyin_du_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_du_15_00");//Kim jeste�?
	AI_Output (self, other,"DIA_Abuyin_du_13_01");//Nazywam si� Abuyin ibn Djadir ibn Omar Kalid ben Hadji al Sharidi. Jestem m�drcem i wr�bit�, astrologiem i znawc� tytoniu.
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
	description	= "Jaki tyto� proponujesz?";
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
	AI_Output (other, self,"DIA_Abuyin_Kraut_15_00");//Jaki tyto� proponujesz?
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_01");//Moje fajki nabite s� ostrym, orze�wiaj�cym tytoniem jab�kowym.
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_02");//Spr�buj, czego tylko zapragniesz, Synu Przygody.
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
	description	= "Czy masz jeszcze jaki� inny tyto�?";
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
	AI_Output (other, self,"DIA_Abuyin_anderen_15_00");//Czy masz jeszcze jaki� inny tyto�?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_01");//U�ywam tylko najlepszego tytoniu. Ta mieszanka o aromacie jab�oni pochodzi z mojej ojczyzny, z Wysp Po�udniowych.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_02");//Ale, oczywi�cie, zawsze ch�tnie spr�buj� nowej mieszanki - je�li komu� uda�oby si� przyrz�dzi� naprawd� dobr�.
	AI_Output (other, self,"DIA_Abuyin_anderen_15_03");//Jak to si� robi?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_04");//We� na przyk�ad moje jab�kowe ziele. A potem spr�buj zmiesza� je z innymi sk�adnikami.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_05");//Mo�esz to zrobi� na stole alchemicznym, je�li oczywi�cie znasz podstawy alchemii.
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
	description	= "Gdzie mog� kupi� tyto� jab�kowy?";
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
	AI_Output (other, self,"DIA_Abuyin_Woher_15_00");//Gdzie mog� kupi� tyto� jab�kowy?
	AI_Output (self, other,"DIA_Abuyin_Woher_13_01");//Dam ci dwie porcje. Od twojej m�dro�ci zale�y, jak je wykorzystasz.
	AI_Output (self, other,"DIA_Abuyin_Woher_13_02");//Je�li pragniesz wi�cej, udaj si� do Zurisa, Mistrza Mikstur. On robi ten tyto� i go sprzedaje.
	
	B_GiveInvItems (self, other, ItMi_ApfelTabak,2);
};
// ************************************************************
FUNC VOID B_TabakProbieren()
{
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_00");//Daj mi spr�bowa� twego tytoniu.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_01");//Nie, ta mieszanka mi nie odpowiada. Ale mo�e kto� doceni ten... eee... przysmak.
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
	description	= "Mam now� mieszank� tytoniu...";
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
	
	AI_Output (other, self,"DIA_Abuyin_Mischung_15_00");//Mam now� mieszank� tytoniu...
	
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
		
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_00");//Daj mi spr�bowa�.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_01");//C� za cudowny smak! Nigdy nie pali�em nic r�wnie dobrego!
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_02");//Jak przygotowa�e� t� mieszank�?
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_03");//Zmiesza�em tyto� z miodem.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_04");//Dobrze si� sprawi�e�, Ojcze Sztuki Fajkowej. By�bym zachwycony, mog�c nabi� me niegodne fajki tym arcydzie�em.
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_05");//A zatem nabij sobie.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_06");//Dzi�ki ci, Synu Szczodro�ci. �aden inny tyto� nie mo�e si� z tym r�wna�. Kupi� od ciebie ka�de �dziebe�ko, jakie mi dostarczysz.
	
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
	description	= "Mam dla ciebie troch� miodowego tytoniu.";
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
	
	AI_Output (other, self,"DIA_Abuyin_Trade_15_00");//Mam dla ciebie troch� miodowego tytoniu.
	
	B_GiveInvItems (other, self, ItmI_HonigTabak, Npc_HasItems (other, Itmi_Honigtabak));
	B_GiveInvItems (self, other, ItmI_Gold, Abuyin_Score);
	
	AI_Output (self, other,"DIA_Abuyin_Trade_13_01");//Interesy z tob� to czysta przyjemno��.
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
	description	= "Mo�e zainteresuje ci� ta paczuszka zi�?";
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
	AI_Output (other, self,"DIA_Abuyin_Herb_15_00");//Mo�e zainteresuje ci� ta paczuszka zi�?
	AI_Output (self, other,"DIA_Abuyin_Herb_13_01");//Czy to bagienne ziele? Och, zabierz to st�d, Synu Nieopatrzno�ci.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_02");//Gdyby z�apa�a mnie z tym stra� miejska, wyl�dowa�bym za kratami - i ty tak�e!
	AI_Output (self, other,"DIA_Abuyin_Herb_13_03");//Je�li chcesz to sprzedawa�, to co� ci poradz� - wyjed� szybko z miasta.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_04");//Wyrzu� to lepiej za murami miasta. Tutaj sprowadzi to na ciebie tylko mn�stwo k�opot�w.
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
	description	= "Czy mo�esz dla mnie powr�y�?";
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
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_00");//Czy mo�esz mi powr�y�?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_01");//Moje talenty s� na twoje us�ugi za skromn� op�at�, o Ojcze Szczodro�ci.
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_02");//Ile chcesz?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_03");//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 25 monet.
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_04");//Ale pami�taj - przysz�o�� zawsze jest niepewna. Mog� tylko ujrze� przelotnie niekt�re chwile.
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
	description	= "Przepowiedz mi przysz�o�� (zap�a� 25 sztuk z�ota).";
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
	AI_Output (other, self,"DIA_Abuyin_Zukunft_15_00");//Opowiedz mi o przysz�o�ci.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 25)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_01");//Dobrze, Poszukiwaczu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		Info_AddChoice (DIA_Abuyin_Zukunft,"Jestem got�w!",DIA_Abuyin_Zukunft_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_02");//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 25 sztuk z�ota.
	};

};
FUNC VOID DIA_Abuyin_Zukunft_Trance()
{
		AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
		
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_00");//...Orkowie... pilnuj� wej�cia... stary tunel... G�rnicza Dolina...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_01");//...Ludzie w l�ni�cych zbrojach... Mag... tw�j przyjaciel jest z nimi... czeka na ciebie...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_02");//...Ogie�! Atak... pot�na istota... p�omienie... wielu... zginie...
		
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");//C� to? Miasto... Ruiny... Quarhodron w Jarkendarze...
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");//On... Zwie si�... Quarhodron w Jarkendarze!
		
		AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_03");//...Przykro mi. Wizja si� sko�czy�a. Nie widz� nic wi�cej.
		
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
	description	= "Czy mo�esz przygotowa� dla mnie jeszcze jedn� wr�b�?";
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
	AI_Output (other, self,"DIA_Abuyin_Nochmal_15_00");//Czy mo�esz przygotowa� dla mnie jeszcze jedn� wr�b�?
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_01");//Och, Synu Tajemniczej Przysz�o�ci, nie w mojej mocy jest uchylenie zas�ony, kt�ra spowija tajemnice czasu.
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_02");//Dopiero kiedy czas ze�le mi kolejny omen, zn�w b�d� m�g� spojrze� w przysz�o�� dla ciebie.
	
	if (Abuyin_Erzaehlt == FALSE)
	{
		AI_Output (other, self,"DIA_Abuyin_Nochmal_15_03");//To znaczy kiedy?
		AI_Output (self, other,"DIA_Abuyin_Nochmal_13_04");//Kiedy przysz�o�� stanie si� tera�niejszo�ci� i minie kolejny etep twojej w�dr�wki.
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
	AI_Output (other, self,"B_Abuyin_Weissagung_15_00");//Czy mo�esz mi powr�y�?
	AI_Output (self, other,"B_Abuyin_Weissagung_13_01");//Tak, czas min��, wi�c przygotuj� dla ciebie wr�b� w zamian za kilka monet.
	AI_Output (other, self,"B_Abuyin_Weissagung_15_02");//Ile?
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
	description	= "Czy mo�esz dla mnie powr�y�?";
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
	AI_Output (self, other,"DIA_Abuyin_Weissagung2_13_00");//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 100 monet.
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
	description	= "Przepowiedz mi przysz�o�� (zap�a� 100 sztuk z�ota).";
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
	AI_Output (other, self,"DIA_Abuyin_Zukunft2_15_00");//Opowiedz mi o przysz�o�ci.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 100)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_01");//Dobrze, Synu Odwagi. Teraz wejd� w trans. Czy jeste� gotowy?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft2);
		Info_AddChoice (DIA_Abuyin_Zukunft2,"Jestem got�w!",DIA_Abuyin_Zukunft2_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_02");//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 100 sztuk z�ota.
	};

};	
FUNC VOID DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_00");//...Najemnik... on ci� b�dzie potrzebowa�... straszne morderstwo... Oko...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_01");//...z�owrodzy sprzymierze�cy... nadchodz�... szukaj� ci�... stra�nik zostanie pokonany...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_02");//...ale tr�jka si� zjednoczy... dopiero wtedy otrzymasz co twoje...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_03");//To wszystko. Nie widz� nic wi�cej.
	
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
	description	= "Czy mo�esz dla mnie powr�y�?";
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
	AI_Output (self, other,"DIA_Abuyin_Weissagung3_13_00");//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 250 monet.
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
	description	= "Przepowiedz mi przysz�o�� (zap�a� 250 sztuk z�ota).";
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
	AI_Output (other, self,"DIA_Abuyin_Zukunft3_15_00");//Opowiedz mi o przysz�o�ci.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 250)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_01");//Dobrze, Synu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft3);
		Info_AddChoice (DIA_Abuyin_Zukunft3,"Jestem got�w!",DIA_Abuyin_Zukunft3_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_02");//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 250 sztuk z�ota.
	};

};	
FUNC VOID  DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_00");//...wymusisz... swoje w�asne przeznaczenie...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_01");//...przez ogie� i �nieg... przez l�d i p�omienie...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_02");//...Ludzie w obcych zbrojach... bagno... jaszczury... oczekuj� ci�...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_03");//To wszystko. Nie widz� nic wi�cej.
	
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
	description	= "Czy mo�esz dla mnie powr�y�?";
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
	AI_Output (self, other,"DIA_Abuyin_Weissagung4_13_00");//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 500 monet.
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
	description	= "Przepowiedz mi przysz�o�� (zap�a� 500 sztuk z�ota).";
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
	AI_Output (other, self,"DIA_Abuyin_Zukunft4_15_00");//Opowiedz mi o przysz�o�ci.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 500)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_01");//Dobrze, Synu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft4);
		Info_AddChoice (DIA_Abuyin_Zukunft4,"Jestem got�w!",DIA_Abuyin_Zukunft4_Trance);	
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_02");//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 500 sztuk z�ota.
	};

};
FUNC VOID DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_00");//...miejsce wiedzy... obcy kraj... ciemne miejsce daleko st�d...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_01");//...dzielni towarzysze... sam dokonasz wyboru...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_02");//...�wi�tynia... stoi samotnie w kr�lestwie Adanosa... ukryta we mgle...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_03");//To wszystko. Nie widz� nic wi�cej.
	
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
	description	= "Czy mo�esz dla mnie powr�y�?";
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
	AI_Output (self, other,"DIA_Abuyin_Weissagung5_13_00");//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 1000 monet.
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
	description	= "Przepowiedz mi przysz�o�� (zap�a� 1000 sztuk z�ota).";
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
	AI_Output (other, self,"DIA_Abuyin_Zukunft5_15_00");//Opowiedz mi o przysz�o�ci.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 1000)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_01");//Dobrze, Synu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft5);
		Info_AddChoice (DIA_Abuyin_Zukunft5,"Jestem got�w!",DIA_Abuyin_Zukunft5_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_02");//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 1000 sztuk z�ota.
	};

};
FUNC VOID DIA_Abuyin_Zukunft5_Trance ()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_00");//...Ciemno�� przenika ziemie... z�o zatryumfuje...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_01");//...Kr�l przegra wojn� z orkami...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_02");//...ty powr�cisz, ale nie zaznasz spokoju...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_03");//To wszystko. Nie widz� nic wi�cej.
		
	DIA_Abuyin_Zukunft5_permanent = TRUE; 
	Abuyin_Zukunft = 5;
	
	Info_ClearChoices (DIA_Abuyin_Zukunft5);
	
	B_GivePlayerXP ((XP_Ambient*4));
};

